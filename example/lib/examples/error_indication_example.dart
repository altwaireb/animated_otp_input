import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

/// Example: Error indication for empty OTP fields.
class ErrorIndicationExample extends StatelessWidget {
  const ErrorIndicationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Indication Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
              length: 6,
              onChanged: (otp) {
                // Error borders are shown automatically for empty fields.
              },
            ),
          ],
        ),
      ),
    );
  }
}
