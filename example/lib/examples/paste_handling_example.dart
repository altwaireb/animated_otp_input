import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

/// Example: Paste handling (autofill when pasting a full OTP).
class PasteHandlingExample extends StatelessWidget {
  const PasteHandlingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paste Handling Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
              length: 6,
              onChanged: (otp) {
                // Paste a 6-digit code into the first field to autofill all fields.
              },
            ),
          ],
        ),
      ),
    );
  }
}
