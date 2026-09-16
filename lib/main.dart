import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'trip/screens/trip_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const YaTripApp());
}

/// Aplicação principal YA Trip Challenge
class YaTripApp extends StatelessWidget {
  const YaTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YA Trip Challenge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const TripScreen(),
    );
  }
}
