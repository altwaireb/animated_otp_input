import 'package:animated_otp_input/animated_otp_input.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Animated OTP Input Example')),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // Basic usage
            AnimatedOtpInput(
              length: 6,
              onChanged: (otp) {
                debugPrint('Entered OTP: $otp');
              },
            ),
            const SizedBox(height: 32),
            // Error message example
            AnimatedOtpInput(
              length: 4,
              errorMessage: 'Please fill all fields',
              theme: const OtpInputTheme(
                errorMessageStyle: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              onChanged: (otp) {},
            ),
            const SizedBox(height: 32),
            // Obscured input example
            AnimatedOtpInput(
              length: 4,
              obscureText: true,
              obscureCharacter: '*',
              onChanged: (otp) {},
            ),
            const SizedBox(height: 32),
            // Disabled input example
            AnimatedOtpInput(
              length: 4,
              enabled: false,
              onChanged: (otp) {},
            ),
            const SizedBox(height: 32),
            // Accessibility customization
            AnimatedOtpInput(
              length: 4,
              semanticsLabel: 'Verification digit',
              semanticsHint: 'Enter the digit for verification',
              onChanged: (otp) {},
            ),
            const SizedBox(height: 32),
            // Haptic feedback customization
            AnimatedOtpInput(
              length: 4,
              enableSuccessHaptic: true,
              enableErrorHaptic: true,
              successHapticFeedback: OtpHapticType.medium,
              errorHapticFeedback: OtpHapticType.vibrate,
              onChanged: (otp) {},
            ),
          ],
        ),
      ),
    );
  }
}
