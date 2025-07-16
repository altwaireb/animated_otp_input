import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

class AutofocusExample extends StatelessWidget {
  const AutofocusExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Autofocus OTP Example')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
              autoFocusFirstField: true,
            ),
          ],
        ),
      ),
    );
  }
}
