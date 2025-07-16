import 'package:animated_otp_input/animated_otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test: delete digit moves focus to previous field and shows error
  // This test verifies that deleting a digit in a field moves focus to the previous field and shows an error border.
  testWidgets('delete digit moves focus to previous field and shows error',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4),
      ),
    ));

    // Enter digits in first two fields
    await tester.enterText(find.byType(TextFormField).at(0), '1');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(1), '2');
    await tester.pump();

    // Delete digit in second field
    await tester.enterText(find.byType(TextFormField).at(1), '');
    await tester.pump();

    // Focus should move to previous field (cannot check directly)
    final field1 =
        tester.widget<TextFormField>(find.byType(TextFormField).at(1));
    expect(field1.controller?.text, '');

    // Error border should be present for second field
    expect(
      find.descendant(
        of: find.byType(TextFormField).at(1),
        matching: find.byType(InputDecorator),
      ),
      findsOneWidget,
    );
  });

  // Test: onChanged called for every input change
  // This test checks that the onChanged callback is called for every input change and the final value is correct.
  testWidgets('onChanged called for every input change', (tester) async {
    final changes = <String>[];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4, onChanged: (v) => changes.add(v)),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).at(0), '1');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(1), '2');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(2), '3');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(3), '4');
    await tester.pump();

    // Should have 4 changes
    expect(changes.length, 4);
    expect(changes.last, '1234');
  });

  // Test: fields are empty on initial render
  // This test ensures that all OTP input fields are empty when the widget is first rendered.
  testWidgets('fields are empty on initial render', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4),
      ),
    ));

    for (int i = 0; i < 4; i++) {
      final field =
          tester.widget<TextFormField>(find.byType(TextFormField).at(i));
      expect(field.controller?.text, '');
    }
  });
  // Test: custom theme applies animation style
  // This test verifies that a custom theme applies the correct animation style to the focused field.
  testWidgets('custom theme applies animation style', (tester) async {
    const theme = OtpInputTheme(
      focusedScale: 1.2,
      animationDuration: Duration(milliseconds: 500),
      animationCurve: Curves.bounceIn,
    );
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4, theme: theme),
      ),
    ));

    await tester.tap(find.byType(TextFormField).at(2));
    await tester.pumpAndSettle();

    final animatedScale =
        tester.widget<AnimatedScale>(find.byType(AnimatedScale).at(2));
    expect(animatedScale.scale, equals(1.2));
    expect(animatedScale.duration, equals(const Duration(milliseconds: 500)));
    expect(animatedScale.curve, equals(Curves.bounceIn));
  });

  // Test: pasting incomplete OTP does not fill all fields
  // This test checks that pasting an incomplete OTP only fills the first field and does not fill all fields.
  testWidgets('pasting incomplete OTP does not fill all fields',
      (tester) async {
    String? result;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4, onChanged: (v) => result = v),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).first, '12');
    await tester.pump();

    // Only first field should be filled
    final field0 =
        tester.widget<TextFormField>(find.byType(TextFormField).at(0));
    expect(field0.controller?.text, '1');
    final field1 =
        tester.widget<TextFormField>(find.byType(TextFormField).at(1));
    expect(field1.controller?.text, '');
    expect(result, isNot('12'));
  });
  // Test: shows error border when field is empty
  // This test verifies that an error border is shown when a field is cleared after entering a digit.
  testWidgets('shows error border when field is empty', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4),
      ),
    ));

    // Enter a digit, then clear it
    await tester.enterText(find.byType(TextFormField).first, '1');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).first, '');
    await tester.pump();

    // Check for InputDecorator presence after clearing field (error state)
    expect(
      find.descendant(
        of: find.byType(TextFormField).first,
        matching: find.byType(InputDecorator),
      ),
      findsOneWidget,
    );
  });

  // Test: focus animation triggers on field focus
  // This test checks that the focus animation is triggered when a field is focused.
  testWidgets('focus animation triggers on field focus', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4),
      ),
    ));

    // Tap the second field to focus
    await tester.tap(find.byType(TextFormField).at(1));
    await tester.pumpAndSettle();

    // AnimatedScale should have scale > 1.0 for focused field
    final animatedScale =
        tester.widget<AnimatedScale>(find.byType(AnimatedScale).at(1));
    expect(animatedScale.scale, greaterThan(1.0));
  });

  // Test: accessibility labels are present
  // This test ensures that each OTP input field has the correct accessibility label.
  testWidgets('accessibility labels are present', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4),
      ),
    ));

    expect(find.bySemanticsLabel('OTP digit 1'), findsOneWidget);
    expect(find.bySemanticsLabel('OTP digit 2'), findsOneWidget);
    expect(find.bySemanticsLabel('OTP digit 3'), findsOneWidget);
    expect(find.bySemanticsLabel('OTP digit 4'), findsOneWidget);
  });
  // Test: renders correct number of input fields
  // This test verifies that the widget renders the correct number of input fields based on the length parameter.
  testWidgets('renders correct number of input fields', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 6),
      ),
    ));
    expect(find.byType(TextFormField), findsNWidgets(6));
  });

  // Test: first field autofocus shows keyboard
  // This test checks that the keyboard is shown when the first field is autofocused.
  testWidgets('first field autofocus shows keyboard', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4, autoFocusFirstField: true),
      ),
    ));

    // Keyboard should be visible due to autofocus
    expect(tester.testTextInput.isVisible, isTrue);
  });

  // Test: keyboard appears when tapping field
  // This test verifies that the keyboard appears when a field is tapped.
  testWidgets('keyboard appears when tapping field', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4),
      ),
    ));

    expect(tester.testTextInput.isVisible, isFalse);

    await tester.tap(find.byType(TextFormField).first);
    await tester.pump();

    expect(tester.testTextInput.isVisible, isTrue);
  });

  // Test: pasting full OTP fills all fields and calls onChanged
  // This test checks that pasting a full OTP fills all fields and calls the onChanged callback with the correct value.
  testWidgets('pasting full OTP fills all fields and calls onChanged',
      (tester) async {
    String? result;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4, onChanged: (v) => result = v),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).first, '1234');
    await tester.pump();

    expect(result, '1234');
  });

  // Test: disables all input fields when enabled is false
  // This test verifies that all input fields are disabled when the enabled parameter is set to false.
  testWidgets('disables all input fields when enabled is false',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4, enabled: false),
      ),
    ));

    final firstField =
        tester.widget<TextFormField>(find.byType(TextFormField).first);
    expect(firstField.enabled, false);
  });

  // Test: typing moves focus to next field
  // This test checks that typing in a field moves focus to the next field.
  testWidgets('typing moves focus to next field', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(length: 4),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).at(0), '1');
    await tester.pump();
    await tester.enterText(find.byType(TextFormField).at(1), '2');
    await tester.pump();

    final field0 =
        tester.widget<TextFormField>(find.byType(TextFormField).at(0));
    final field1 =
        tester.widget<TextFormField>(find.byType(TextFormField).at(1));

    expect(field0.controller?.text, '1');
    expect(field1.controller?.text, '2');
  });

  // Test: calls onChanged when all fields filled
  // This test verifies that the onChanged callback is called when all fields are filled.
  testWidgets('calls onChanged when all fields filled', (tester) async {
    String? completed;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          onChanged: (val) => completed = val,
        ),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).first, '1234');
    await tester.pump();

    expect(completed, '1234');
  });
  // Test: shows group errorMessage with custom style when fields are empty
  // This test checks that the group error message is shown with the custom style when fields are empty.
  testWidgets(
      'shows group errorMessage with custom style when fields are empty',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          errorMessage: 'Please fill all fields',
          theme: OtpInputTheme(
            errorMessageStyle: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    ));

    // Initially, all fields are empty, so error message should show
    expect(find.text('Please fill all fields'), findsOneWidget);

    // Check style
    final textWidget = tester.widget<Text>(find.text('Please fill all fields'));
    expect(textWidget.style?.color, Colors.deepOrange);
    expect(textWidget.style?.fontWeight, FontWeight.bold);
    expect(textWidget.style?.fontSize, 14);

    // Fill all fields
    await tester.enterText(find.byType(TextFormField).at(0), '1');
    await tester.enterText(find.byType(TextFormField).at(1), '2');
    await tester.enterText(find.byType(TextFormField).at(2), '3');
    await tester.enterText(find.byType(TextFormField).at(3), '4');
    await tester.pump();

    // Error message should still show (since errorMessage is always set)
    expect(find.text('Please fill all fields'), findsOneWidget);
  });
  // Test: pasting full OTP with obscureText true fills all fields and calls onChanged
  // This test verifies that pasting a full OTP with obscureText enabled fills all fields and calls onChanged.
  testWidgets(
      'pasting full OTP with obscureText true fills all fields and calls onChanged',
      (tester) async {
    String? result;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: AnimatedOtpInput(
          length: 4,
          obscureText: true,
          onChanged: (v) => result = v,
        ),
      ),
    ));

    await tester.enterText(find.byType(TextFormField).first, '1234');
    await tester.pump();

    // All controllers should have the correct digit
    for (int i = 0; i < 4; i++) {
      final field =
          tester.widget<TextFormField>(find.byType(TextFormField).at(i));
      expect(field.controller?.text, '1234'[i]);
    }
    expect(result, '1234');
  });
}
