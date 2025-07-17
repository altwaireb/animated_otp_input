# 🔢 animated_otp_input

A highly customizable, animated, and accessible One-Time Password (OTP) input widget for Flutter. Supports advanced theming, error handling, accessibility, and smooth user experience for OTP, PIN, or verification code entry.

[![pub package](https://img.shields.io/pub/v/animated_otp_input.svg)](https://pub.dev/packages/animated_otp_input)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/flutter-ready-blue.svg)](https://flutter.dev)
[![Dart SDK](https://img.shields.io/badge/dart-%5E3.0-blue.svg)](https://dart.dev)

---

## ✨ Features

- 🧩 **Customizable OTP length and appearance**: Choose the number of fields, field size, spacing, and border style.
- 📋 **Smart paste detection**: Autofills all fields when a full OTP is pasted.
- 🎯 **Auto-focus navigation**: Focus automatically shifts as the user types or deletes.
- 🛡️ **Obscured input for privacy**: Hide digits for PIN entry with a custom obscuring character.
- 🎨 **Advanced theming**: Use `OtpInputTheme` to style borders, colors, text, animation, and error messages.
- 🌍 **Consistent LTR layout**: Always left-to-right for digit entry, even in RTL locales.
- 🧠 **Auto-submit support**: Easily trigger actions when the OTP is complete via `onChanged`.
- 🚫 **Disable input**: Make fields read-only during loading or verification.
- ♿ **Accessibility**: Semantics labels and hints for screen readers, fully customizable.
- ⚠️ **Error handling**: Per-field error indication and group-level error messages with custom styles.
- 🌀 **Animated focus**: Customizable scale, duration, and curve for field focus animations.
- 📳 **Haptic feedback**: Optionally trigger haptic feedback on success or error, with customizable feedback type for tactile confirmation.

---

## 🚀 Installation

Add the package using the command line:

```sh
flutter pub add animated_otp_input
```

Or manually add to your `pubspec.yaml`:

```yaml
dependencies:
  animated_otp_input: ^1.0.6
```

Then run:

```sh
flutter pub get
```

Import the package:

```dart
import 'package:animated_otp_input/animated_otp_input.dart';
```

---

## 📦 Usage

### Basic Example

```dart
AnimatedOtpInput(
  length: 6,
  onChanged: (otp) {
    print('Entered OTP: $otp');
  },
)
```

### Error Message Example

```dart
AnimatedOtpInput(
  length: 4,
  errorMessage: 'Please fill all fields', // Show error message below the fields
  theme: OtpInputTheme(
    errorMessageStyle: TextStyle(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  ),
  onChanged: (otp) {
    // Show error if not all fields are filled
  },
)
```

---

## 🧑‍💻 Parameters

| Name                    | Type                     | Default                 | Description                                                        |
|-------------------------|--------------------------|-------------------------|--------------------------------------------------------------------|
| `length`              | `int`                    | `6`                     | Number of OTP digits.                                              |
| `onChanged`           | `void Function(String)?` | `null`                  | Callback triggered when the OTP value changes.                     |
| `enabled`             | `bool`                   | `true`                  | Enables or disables the input fields.                              |
| `fieldWidth`          | `double`                 | `45`                    | Width of each OTP input field.                                     |
| `fieldSpacing`        | `double`                 | `4`                     | Horizontal spacing between input fields.                           |
| `theme`               | `OtpInputTheme`          | `const OtpInputTheme()` | Customize input decoration, text style, colors, animation, errors. |
| `obscureText`         | `bool`                   | `false`                 | Whether to obscure each input (e.g., for PIN input).               |
| `obscureCharacter`    | `String`                 | `'•'`                   | The character used when `obscureText` is true.                     |
| `autoFocusFirstField` | `bool`                   | `false`                 | Whether to autofocus the first input field when the widget builds. |
| `errorMessage`        | `String?`                | `null`                  | Group-level error message shown below the fields. If set, empty fields will show error borders and the message will be displayed. |
| `semanticsLabel`      | `String`                 | `'OTP digit'`           | Base label for accessibility (screen readers).                     |
| `semanticsHint`       | `String?`                | `null`                  | Base hint for accessibility.                                       |
| `enableSuccessHaptic`   | `bool?`                  | `true`                  | Enable haptic feedback on successful OTP entry.                    |
| `enableErrorHaptic`     | `bool?`                  | `true`                  | Enable haptic feedback on OTP entry error.                         |
| `successHapticFeedback` | `OtpHapticType?`         | `OtpHapticType.light`   | Custom haptic feedback type for success.                           |
| `errorHapticFeedback`   | `OtpHapticType?`         | `OtpHapticType.heavy`   | Custom haptic feedback type for error.                             |

---

## 🎨 Customization

### Theming with `OtpInputTheme`

```dart
AnimatedOtpInput(
  length: 4,
  fieldWidth: 48,
  fieldSpacing: 8,
  theme: OtpInputTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    fillColor: Colors.grey.shade100,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.deepPurple),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    errorMessageStyle: TextStyle(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    borderSideWidth: 2.0, // Custom border width
    focusedScale: 1.2, // Custom scale animation
    animationDuration: Duration(milliseconds: 300),
    animationCurve: Curves.easeInOut, // Custom animation curve
  ),
)
```

### Enable Obscured Input

```dart
AnimatedOtpInput(
  obscureText: true,
  obscureCharacter: '*', // Default: •
)
```

### Disable Input

```dart
AnimatedOtpInput(
  enabled: false,
)
```

### Autofocus First Field

```dart
AnimatedOtpInput(
  autoFocusFirstField: true,
)
```

### Accessibility Customization

```dart
AnimatedOtpInput(
  semanticsLabel: 'Verification digit',
  semanticsHint: 'Enter the digit for verification',
)
```

### Haptic Feedback Customization

You can control the type and intensity of haptic feedback for both success and error events using the following parameters:

- `enableSuccessHaptic`: Enable/disable haptic feedback when OTP is successfully entered.
- `enableErrorHaptic`: Enable/disable haptic feedback when an error occurs.
- `successHapticFeedback`: Choose the feedback type for success (`light`, `medium`, `heavy`, `vibrate`, `none`).
- `errorHapticFeedback`: Choose the feedback type for error (`light`, `medium`, `heavy`, `vibrate`, `none`).

Example:

```dart
AnimatedOtpInput(
  enableSuccessHaptic: true,
  enableErrorHaptic: true,
  successHapticFeedback: OtpHapticType.medium,
  errorHapticFeedback: OtpHapticType.vibrate,
)
```

---

## 🧪 Testing

Comprehensive widget tests are included for error indication, error message display, custom error styles, accessibility, animation, and more. See the `test/` directory for details.

---

## 📸 Demo

![Animated OTP Input Demo](https://raw.githubusercontent.com/altwaireb/animated_otp_input/main/example/demo_2.gif)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🤝 Contributions

Contributions, issues, and feature requests are welcome!  
Feel free to [open an issue](https://github.com/altwaireb/animated_otp_input/issues) or submit a pull request.

---

## ⭐ Feedback

If you find this package helpful, please give it a ⭐ on [pub.dev](https://pub.dev/packages/animated_otp_input) and share it with others.