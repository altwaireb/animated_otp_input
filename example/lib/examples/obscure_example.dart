import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

class ObscureExample extends StatelessWidget {
  const ObscureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Obscure OTP Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
              length: 5,
              fieldWidth: 50,
              fieldSpacing: 8,
              theme: OtpInputTheme(
                borderRadius: BorderRadius.circular(18),
              ),
              obscureText: true,
              obscureCharacter: '*',
              onChanged: (otp) => debugPrint('Hidden OTP: $otp'),
            ),
          ],
        ),
      ),
    );
  }
}
