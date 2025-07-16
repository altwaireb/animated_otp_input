// This file sets up a mock for HapticFeedback using Mockito for use in widget tests.
// It allows you to intercept and verify haptic feedback calls in your tests.

import 'package:flutter/services.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<HapticFeedback>()])
void main() {}
