## 1.0.0

- Initial stable release of `animated_otp_input`.
- Customizable OTP length: Choose any number of input fields for OTP, PIN, or verification codes.
- Field size and spacing: Configure the width and horizontal spacing of each input field.
- Customizable border style: Set border, focused border, error border, border radius, and border width for each field.
- Smart paste detection: Automatically fills all fields when a complete OTP is pasted into the first field.
- Animated focus: Each field animates on focus with customizable scale, duration, and curve for smooth UX.
- Per-field error indication: Empty fields show error borders for instant feedback.
- Group-level error messages: Display a custom error message below the input fields with customizable style.
- Accessibility: Each field has customizable semantics labels and hints for screen readers.
- Advanced theming: Use `OtpInputTheme` to style borders, fill color, text style, error message style, animation, and more.
- Obscured input: Hide digits for PIN entry with a custom obscuring character.
- Auto-focus navigation: Focus automatically shifts to the next field as the user types, or to the previous field when deleting.
- Auto-submit support: Easily trigger actions when the OTP is complete using the `onChanged` callback.
- Disable input: Make all fields read-only during loading or verification by setting `enabled: false`.
- Haptic feedback: Optionally trigger haptic feedback on success or error, with customizable feedback type and intensity.
- Accessibility: Consistent left-to-right layout for digit entry, even in RTL locales.
- Comprehensive widget tests: Includes tests for error indication, error message display, custom error styles, accessibility, animation, haptic feedback, and more.


# 1.0.1

- fix demo image

# 1.0.1

- remove screenshots 

# 1.0.2

- Removed screenshots from package configuration to resolve pub.dev publishing issues.
- Updated CHANGELOG to reflect recent fixes.

# 1.0.3

- Limit topics to 5 for pub.dev compliance

# 1.0.4

- Added comprehensive usage examples in example/example.dart

# 1.0.5

### Added
- Comprehensive usage examples in `example/lib/main.dart` for better documentation and pub.dev score

### Changed
- Custom `errorBorder` from `OtpInputTheme` is now correctly applied to the enabled border when a field is in error, allowing full theming of error states.

### Removed
- Deleted previous example in `example/example.dart`