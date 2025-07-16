import 'package:flutter/material.dart';

/// Defines the visual and animation style for [AnimatedOtpInput] fields.
///
/// Customize borders, fill color, text style, error style, border radius, and animation behavior.
///
/// Example usage:
/// ```dart
/// AnimatedOtpInput(
///   theme: OtpInputTheme(
///     border: OutlineInputBorder(),
///     fillColor: Colors.grey[200],
///     textStyle: TextStyle(fontSize: 20),
///     focusedScale: 1.15,
///     animationDuration: Duration(milliseconds: 300),
///     animationCurve: Curves.easeOutBack,
///   ),
/// )
/// ```
class OtpInputTheme {
  /// Default border for OTP fields.
  final InputBorder? border;

  /// Border when a field is focused.
  final InputBorder? focusedBorder;

  /// Border when a field is in error state.
  final InputBorder? errorBorder;

  /// Background color of OTP fields.
  final Color? fillColor;

  /// Text style for digits.
  final TextStyle? textStyle;

  /// Text style for the error message shown below OTP field.
  ///
  /// Used for the [errorMessage] property in [AnimatedOtpInput].
  final TextStyle? errorMessageStyle;

  /// Corner radius for fields.
  final BorderRadius? borderRadius;

  /// Duration of focus scale animation.
  final Duration? animationDuration;

  /// Curve of focus scale animation.
  final Curve? animationCurve;

  /// Scale factor when a field is focused.
  final double? focusedScale;

  /// Border width for all OTP field borders (default: 2.0).
  final double borderSideWidth;

  /// Creates an [OtpInputTheme] for customizing [AnimatedOtpInput] fields.
  const OtpInputTheme({
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.fillColor,
    this.textStyle,
    this.errorMessageStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.focusedScale = 1.1,
    this.borderSideWidth = 2.0,
  });
}
