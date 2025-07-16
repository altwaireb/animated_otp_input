import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

void main() {
  // --- Haptic Channel Setup ---
  const MethodChannel hapticChannel = SystemChannels.platform;
  late List<MethodCall> hapticCalls;

  setUp(() {
    hapticCalls = [];
  });

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(hapticChannel, null);
  });

  // --- Helper Functions ---
  Future<void> overrideHaptics(WidgetTester tester) async {
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      hapticChannel,
      (MethodCall call) async {
        hapticCalls.add(call);
        return null;
      },
    );
  }

  Future<void> fillAllFields(WidgetTester tester, int length) async {
    for (int i = 0; i < length; i++) {
      await tester.enterText(find.byType(TextFormField).at(i), '$i');
      await tester.pump();
    }
  }

  // --- Test Cases ---

  // Test: triggers success haptic when all fields are filled
  // This test verifies that haptic feedback is triggered for success when all OTP fields are filled.
  testWidgets('triggers success haptic when all fields are filled',
      (tester) async {
    await overrideHaptics(tester);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          enableSuccessHaptic: true,
          successHapticFeedback: OtpHapticType.light,
        ),
      ),
    ));

    await fillAllFields(tester, 4);

    expect(
      hapticCalls,
      anyElement(predicate<MethodCall>(
        (call) => call.method == 'HapticFeedback.vibrate',
        'Expected haptic feedback for success.',
      )),
    );
  });

  // Test: does not trigger success haptic if disabled
  // This test checks that no haptic feedback is triggered for success when enableSuccessHaptic is false.
  testWidgets('does not trigger success haptic if disabled', (tester) async {
    await overrideHaptics(tester);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          enableSuccessHaptic: false,
          successHapticFeedback: OtpHapticType.light,
        ),
      ),
    ));

    await fillAllFields(tester, 4);

    expect(
      hapticCalls.where((call) => call.method.contains('HapticFeedback')),
      isEmpty,
      reason: 'No haptic should be triggered when success is disabled.',
    );
  });

  // Test: does not trigger haptic if successHapticFeedback is none
  // This test verifies that no haptic feedback is triggered when successHapticFeedback is set to none.
  testWidgets('does not trigger haptic if successHapticFeedback is none',
      (tester) async {
    await overrideHaptics(tester);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          enableSuccessHaptic: true,
          successHapticFeedback: OtpHapticType.none,
        ),
      ),
    ));

    await fillAllFields(tester, 4);

    expect(
      hapticCalls.where((call) => call.method.contains('HapticFeedback')),
      isEmpty,
      reason: 'No haptic should be triggered when type is none.',
    );
  });

  // Test: triggers error haptic when fields are empty and errorMessage is shown
  // This test checks that error haptic feedback is triggered when an error message is shown and fields are empty.
  testWidgets(
      'triggers error haptic when fields are empty and errorMessage is shown',
      (tester) async {
    await overrideHaptics(tester);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          errorMessage: 'Invalid OTP',
          enableErrorHaptic: true,
          errorHapticFeedback: OtpHapticType.heavy,
        ),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).at(0), '1');
    await tester.pump();

    expect(
      hapticCalls,
      anyElement(predicate<MethodCall>(
        (call) => call.method == 'HapticFeedback.vibrate',
        'Expected haptic feedback for error.',
      )),
    );
  });

  // Test: does not trigger error haptic if disabled
  // This test verifies that no error haptic feedback is triggered when enableErrorHaptic is false.
  testWidgets('does not trigger error haptic if disabled', (tester) async {
    await overrideHaptics(tester);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          errorMessage: 'Invalid OTP',
          enableErrorHaptic: false,
          errorHapticFeedback: OtpHapticType.heavy,
        ),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).at(0), '1');
    await tester.pump();

    expect(
      hapticCalls.where((call) => call.method.contains('HapticFeedback')),
      isEmpty,
      reason: 'No haptic should be triggered when error is disabled.',
    );
  });

  // Test: does not trigger haptic if errorHapticFeedback is none
  // This test checks that no error haptic feedback is triggered when errorHapticFeedback is set to none.
  testWidgets('does not trigger haptic if errorHapticFeedback is none',
      (tester) async {
    await overrideHaptics(tester);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          errorMessage: 'Invalid OTP',
          enableErrorHaptic: true,
          errorHapticFeedback: OtpHapticType.none,
        ),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).at(0), '1');
    await tester.pump();

    expect(
      hapticCalls.where((call) => call.method.contains('HapticFeedback')),
      isEmpty,
      reason: 'No haptic should be triggered when error feedback is none.',
    );
  });

  // Test: triggers only success haptic when all fields are filled and error haptic is enabled
  // This test verifies that only success haptic feedback is triggered when all fields are filled, even if error haptic is enabled.
  testWidgets(
      'triggers only success haptic when all fields are filled and error haptic is enabled',
      (tester) async {
    await overrideHaptics(tester);

    const hapticType = OtpHapticType.light;
    const errorHapticType = OtpHapticType.vibrate;

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          enableSuccessHaptic: true,
          successHapticFeedback: hapticType,
          enableErrorHaptic: true,
          errorHapticFeedback: errorHapticType,
        ),
      ),
    ));

    await fillAllFields(tester, 4);

    expect(
      hapticCalls.any((call) =>
          call.method == 'HapticFeedback.vibrate' &&
          call.arguments == 'HapticFeedbackType.vibrate'),
      isFalse,
      reason: 'Error haptic should not be triggered on success.',
    );
  });
}
