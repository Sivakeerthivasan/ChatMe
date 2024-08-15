import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

//Pages
import './pages/splash_screen.dart';

void main() {
  runApp(SplashScreen(key: UniqueKey(), onInitialization: () {}));
}
