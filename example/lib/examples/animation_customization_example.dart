import 'package:flutter/material.dart';
import 'package:animated_otp_input/animated_otp_input.dart';

/// Example: Customizing animation (scale, duration, curve) for focused fields.
class AnimationCustomizationExample extends StatelessWidget {
  const AnimationCustomizationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Customization Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOtpInput(
              length: 6,
              theme: const OtpInputTheme(
                focusedScale: 1.2,
                animationDuration: Duration(milliseconds: 400),
                animationCurve: Curves.elasticOut,
              ),
              onChanged: (otp) {},
            ),
          ],
        ),
      ),
    );
  }
}
