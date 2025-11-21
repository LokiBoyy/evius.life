import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'screens/home_page.dart';
import 'utils/seo_service.dart';

void main() {
  runApp(const EviusLifeApp());
}

class EviusLifeApp extends StatefulWidget {
  const EviusLifeApp({super.key});

  @override
  State<EviusLifeApp> createState() => _EviusLifeAppState();
}

class _EviusLifeAppState extends State<EviusLifeApp> {
  @override
  void initState() {
    super.initState();
    // Set default SEO for home page
    SeoService.setHomePageMeta();
  }

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
