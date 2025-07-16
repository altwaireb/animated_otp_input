import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

class ThemedExample extends StatelessWidget {
  const ThemedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Themed OTP Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade200,
              ),
              child: Icon(
                Icons.key_outlined,
                size: 60,
                color: Colors.blue.shade50,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Password',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Inter your password here',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 20),
            AnimatedOtpInput(
              length: 4,
              fieldSpacing: 12,
              theme: OtpInputTheme(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade700, width: 2),
                    borderRadius: BorderRadius.circular(100)),
                fillColor: Colors.blue.shade100,
                textStyle: const TextStyle(fontSize: 22, color: Colors.black87),
              ),
              onChanged: (otp) => debugPrint('OTP: $otp'),
            ),
          ],
        ),
      ),
    );
  }
}
