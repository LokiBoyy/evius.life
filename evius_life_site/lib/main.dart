import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const EviusLifeApp());
}

class EviusLifeApp extends StatelessWidget {
  const EviusLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'evius.life',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.generateRoute,
      home: const HomePage(),
    );
  }
}
