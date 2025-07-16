import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

class BasicExample extends StatelessWidget {
  const BasicExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic OTP Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(Icons.security_outlined,
                  size: 60, color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(height: 30),
            const Text(
              'Verify',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your OTP was sent to you via SMS',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),
            AnimatedOtpInput(
              length: 6,
              onChanged: (otp) {
                debugPrint('OTP: $otp');
              },
            ),
          ],
        ),
      ),
    );
  }
}
