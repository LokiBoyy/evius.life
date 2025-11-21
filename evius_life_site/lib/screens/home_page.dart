import 'package:flutter/material.dart';
import '../widgets/neon_gradient_background.dart';
import '../widgets/header.dart';
import '../widgets/hero_section.dart';
import '../widgets/philosophy_section.dart';
import '../widgets/work_section.dart';
import '../widgets/footer.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';

/// Home page screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                SizedBox(height: isMobile ? 60 : AppConstants.spacingMassive),
                const HeroSection(),
                SizedBox(
                  height: isMobile
                      ? AppConstants.spacingHuge
                      : AppConstants.spacingEnormous,
                ),
                const PhilosophyAndPrinciplesSection(),
                SizedBox(
                  height: isMobile
                      ? AppConstants.spacingHuge
                      : AppConstants.spacingEnormous,
                ),
                const WorkSection(),
                SizedBox(
                  height: isMobile
                      ? AppConstants.spacingHuge
                      : AppConstants.spacingEnormous,
                ),
                const Footer(),
                SizedBox(height: isMobile ? AppConstants.spacingXL : 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
