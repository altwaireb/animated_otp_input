import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

/// Example: Accessibility features using Semantics for screen readers.
class AccessibilityExample extends StatelessWidget {
  const AccessibilityExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
              length: 6,
              onChanged: (otp) {},
            ),
          ],
        ),
      ),
    );
  }
}
// Each OTP field is wrapped in Semantics for accessibility by default.
