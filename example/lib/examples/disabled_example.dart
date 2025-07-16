import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

class DisabledExample extends StatelessWidget {
  const DisabledExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Disabled OTP Example')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
