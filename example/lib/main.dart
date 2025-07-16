import 'package:animated_otp_input_example/examples/accessibility_example.dart';
import 'package:animated_otp_input_example/examples/animation_customization_example.dart';
import 'package:animated_otp_input_example/examples/error_indication_example.dart';
import 'package:animated_otp_input_example/examples/error_message_example.dart';
import 'package:animated_otp_input_example/examples/paste_handling_example.dart';
import 'package:flutter/material.dart';
import 'examples/basic_example.dart';
import 'examples/themed_example.dart';
import 'examples/obscure_example.dart';
import 'examples/disabled_example.dart';
import 'examples/autofocus_example.dart';

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
      themeMode: ThemeMode.dark,
      home: const ExampleMenu(),
    );
  }
}

class ExampleMenu extends StatelessWidget {
  const ExampleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Input Examples')),
      body: ListView(
        children: const [
          _ExampleTile(title: 'Basic', child: BasicExample()),
          _ExampleTile(title: 'Themed', child: ThemedExample()),
          _ExampleTile(title: 'Obscure', child: ObscureExample()),
          _ExampleTile(title: 'Disabled', child: DisabledExample()),
          _ExampleTile(title: 'Autofocus', child: AutofocusExample()),
          _ExampleTile(title: 'Accessibility', child: AccessibilityExample()),
          _ExampleTile(title: 'Paste Handling', child: PasteHandlingExample()),
          _ExampleTile(
              title: 'Error Indication', child: ErrorIndicationExample()),
          _ExampleTile(title: 'Error Message', child: ErrorMessageExample()),
          _ExampleTile(
              title: 'Animation Customization',
              child: AnimationCustomizationExample()),
        ],
      ),
    );
  }
}

class _ExampleTile extends StatelessWidget {
  final String title;
  final Widget child;
  const _ExampleTile({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => child),
      ),
    );
  }
}
