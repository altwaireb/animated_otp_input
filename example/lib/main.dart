import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated OTP Input Examples',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: const ExampleMenu(),
    );
  }
}

class ExampleMenu extends StatelessWidget {
  const ExampleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Animated OTP Input Example')),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Basic OTP Input',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                // Basic usage
                AnimatedOtpInput(
                  length: 6,
                  onChanged: (otp) {
                    debugPrint('Entered OTP: $otp');
                  },
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Basic OTP Input',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedOtpInput(
                  length: 4,
                  fieldSpacing: 12,
                  theme: OtpInputTheme(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade700, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    fillColor: Colors.blue.shade100,
                    textStyle:
                        const TextStyle(fontSize: 22, color: Colors.black87),
                  ),
                  onChanged: (otp) => debugPrint('OTP: $otp'),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Error message',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                // Error message example
                AnimatedOtpInput(
                  length: 4,
                  errorMessage: 'Please fill all fields',
                  theme: const OtpInputTheme(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    errorMessageStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  onChanged: (otp) {},
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Animation Customization',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedOtpInput(
                  length: 6,
                  theme: const OtpInputTheme(
                    focusedScale: 1.2,
                    animationDuration: Duration(milliseconds: 400),
                    animationCurve: Curves.elasticOut,
                  ),
                  onChanged: (otp) {},
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Obscured Input',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                // Obscured input example
                AnimatedOtpInput(
                  length: 4,
                  obscureText: true,
                  obscureCharacter: '*',
                  onChanged: (otp) {},
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Disabled input',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                // Disabled input example
                AnimatedOtpInput(
                  length: 4,
                  enabled: false,
                  onChanged: (otp) {},
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Accessibility customization',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                // Accessibility customization
                AnimatedOtpInput(
                  length: 4,
                  semanticsLabel: 'Verification digit',
                  semanticsHint: 'Enter the digit for verification',
                  onChanged: (otp) {},
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text(
                    'Haptic feedback customization',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
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
        ),
      ),
    );
  }
}
