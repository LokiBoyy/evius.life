import 'package:flutter/material.dart';
import '../widgets/neon_gradient_background.dart';
import '../widgets/header.dart';
import '../widgets/hero_section.dart';
import '../widgets/philosophy_section.dart';
import '../widgets/work_section.dart';
import '../widgets/footer.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';
import '../utils/seo_service.dart';

/// Home page screen
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Ensure SEO is set when page loads
    SeoService.setHomePageMeta();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: SizedBox.expand(
        child: NeonGradientBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: isMobile
                      ? AppConstants.spacingMD
                      : AppConstants.spacingXL,
                ),
                Padding(
                  padding: Responsive.padding(context),
                  child: const Header(),
                ),
                SizedBox(height: isMobile ? 80 : AppConstants.spacingMassive),
                const HeroSection(),
                SizedBox(
                  height: isMobile
                      ? AppConstants.spacingMassive
                      : AppConstants.spacingEnormous,
                ),
                const PhilosophyAndPrinciplesSection(),
                SizedBox(
                  height: isMobile
                      ? AppConstants.spacingMassive
                      : AppConstants.spacingEnormous,
                ),
                const WorkSection(),
                SizedBox(
                  height: isMobile
                      ? AppConstants.spacingMassive
                      : AppConstants.spacingEnormous,
                ),
                const Footer(),
                SizedBox(height: isMobile ? AppConstants.spacingXXXL : 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
