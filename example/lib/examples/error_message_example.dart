import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

class ErrorMessageExample extends StatefulWidget {
  const ErrorMessageExample({super.key});

  @override
  State<ErrorMessageExample> createState() => _ErrorMessageExampleState();
}

class _ErrorMessageExampleState extends State<ErrorMessageExample> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Error Message Example')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
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
          ],
        ),
      ),
    );
  }
}
