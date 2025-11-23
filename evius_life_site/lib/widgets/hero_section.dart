import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';
import '../utils/responsive.dart';
import '../config/constants.dart';

/// Hero section widget
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: Responsive.padding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: isMobile ? 0 : 1,
                child: _buildBoxContainer(context, theme, isMobile),
              ),
              SizedBox(
                width: isMobile ? 0 : 60,
                height: isMobile ? AppConstants.spacingXL : 0,
              ),
              Flexible(
                flex: isMobile ? 0 : 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: isMobile ? 8 : 180,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"Life" is short ... MAKE IT.',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: Responsive.value(
                            context: context,
                            mobile: 36.0 * 0.5,
                            tablet: 56.0 * 0.5,
                            desktop: 80.0 * 0.5,
                          ),
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: 0.6),
                        ),
                      ),
                      SizedBox(
                        height: Responsive.value(
                          context: context,
                          mobile: 24.0,
                          tablet: 16.0,
                          desktop: 24.0,
                        ),
                      ),
                      Text(
                        'Mindful.',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: Responsive.value(
                            context: context,
                            mobile: 36.0,
                            tablet: 56.0,
                            desktop: 80.0,
                          ),
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          letterSpacing: 1,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'Intentional.',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: Responsive.value(
                            context: context,
                            mobile: 36.0,
                            tablet: 56.0,
                            desktop: 80.0,
                          ),
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          letterSpacing: 1,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      Text(
                        'Beautiful.',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: Responsive.value(
                            context: context,
                            mobile: 36.0,
                            tablet: 56.0,
                            desktop: 80.0,
                          ),
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                          letterSpacing: 1,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 600.ms, delay: 100.ms),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 60 : 100),
          _buildVisualElement(context, theme, isMobile),
        ],
      ),
    );
  }

  Widget _buildBoxContainer(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Container(
      width: isMobile ? double.infinity : null,
      height: isMobile ? 200 : 400,
      child: Center(
        child: _RotatingLifeText(isMobile: isMobile, theme: theme),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms);
  }

  Widget _buildVisualElement(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusXL),
      ),
      color: theme.colorScheme.primaryContainer,
      child: SizedBox(
        width: double.infinity,
        height: isMobile ? 400 : 600,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.secondary,
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              color: theme.colorScheme.surface,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_iphone,
                    size: isMobile ? 80 : 120,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: AppConstants.spacingMD),
                  Text(
                    'Visual Preview',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
        .animate()
        .scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
          duration: 800.ms,
          delay: 300.ms,
          curve: Curves.easeOutCubic,
        )
        .fadeIn(duration: 800.ms, delay: 300.ms);
  }
}

/// Rotating "Life" text widget that cycles through different languages
class _RotatingLifeText extends StatefulWidget {
  const _RotatingLifeText({
    required this.isMobile,
    required this.theme,
  });

  final bool isMobile;
  final ThemeData theme;

  @override
  State<_RotatingLifeText> createState() => _RotatingLifeTextState();
}

class _RotatingLifeTextState extends State<_RotatingLifeText> {
  static const List<String> _lifeTranslations = [
    '生命', // Chinese
    'حياة', // Arabic
    'జీవితం', // Telugu
    'जीवन', // Hindi
    'жизнь', // Russian
    '생명', // Korean
    'ชีวิต', // Thai
    'জীবন', // Bengali
    'வாழ்க்கை', // Tamil
    'ζωή', // Ancient Greek
    'ຊີວິດ', // Lao
  ];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Rotate every 2 seconds (like a ticking clock)
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _rotateText();
    });
  }

  void _rotateText() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _lifeTranslations.length;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.isMobile ? 16 : 24,
          right: widget.isMobile ? 48 : 80,
          top: widget.isMobile ? 8 : 16,
          bottom: widget.isMobile ? 8 : 16,
        ),
        child: Text(
          _lifeTranslations[_currentIndex],
          style: widget.theme.textTheme.displayLarge?.copyWith(
            fontSize: widget.isMobile ? 120.0 : 200.0,
            fontWeight: FontWeight.w300,
            letterSpacing: 2,
            color: widget.theme.colorScheme.primary,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }
}
