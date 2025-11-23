import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import '../utils/responsive.dart';
import '../config/constants.dart';

/// Hero section widget displaying rotating "Life" text and call-to-action text
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // Animation constants
  static const _fadeInDuration = Duration(milliseconds: 600);
  static const _fadeInDelay = Duration(milliseconds: 100);
  static const _scaleDuration = Duration(milliseconds: 800);
  static const _scaleDelay = Duration(milliseconds: 300);

  // Spacing constants
  static const _spacingBetweenSections = 60.0;
  static const _spacingBetweenSectionsDesktop = 100.0;
  static const _spacingBetweenColumns = 60.0;

  // Font size multipliers
  static const _introTextSizeMultiplier = 0.5;
  static const _mainTextSizeMobile = 36.0;
  static const _mainTextSizeTablet = 56.0;
  static const _mainTextSizeDesktop = 80.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: Responsive.padding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMainContent(context, theme, isMobile),
          SizedBox(
            height: isMobile
                ? _spacingBetweenSections
                : _spacingBetweenSectionsDesktop,
          ),
          _buildVisualElement(context, theme, isMobile),
        ],
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: isMobile ? 0 : 1,
          child: _buildRotatingLifeContainer(context, theme, isMobile),
        ),
        SizedBox(
          width: isMobile ? 0 : _spacingBetweenColumns,
          height: isMobile ? AppConstants.spacingXL : 0,
        ),
        Flexible(
          flex: isMobile ? 0 : 1,
          child: _buildCallToActionText(context, theme, isMobile),
        ),
      ],
    );
  }

  Widget _buildCallToActionText(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIntroText(context, theme),
        _buildSpacing(context),
        _buildMainText(context, theme, 'Mindful.', theme.colorScheme.onSurface),
        _buildMainText(
            context, theme, 'Intentional.', theme.colorScheme.primary),
        _buildMainText(
            context, theme, 'Beautiful.', theme.colorScheme.secondary),
      ],
    ).animate().fadeIn(
          duration: _fadeInDuration,
          delay: _fadeInDelay,
        );
  }

  Widget _buildIntroText(BuildContext context, ThemeData theme) {
    return Text(
      '"Life" is short ... MAKE IT.',
      style: theme.textTheme.displayLarge?.copyWith(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w300,
        fontSize: Responsive.value(
          context: context,
          mobile: _mainTextSizeMobile * _introTextSizeMultiplier,
          tablet: _mainTextSizeTablet * _introTextSizeMultiplier,
          desktop: _mainTextSizeDesktop * _introTextSizeMultiplier,
        ),
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
    );
  }

  Widget _buildSpacing(BuildContext context) {
    return SizedBox(
      height: Responsive.value(
        context: context,
        mobile: 24.0,
        tablet: 16.0,
        desktop: 24.0,
      ),
    );
  }

  Widget _buildMainText(
    BuildContext context,
    ThemeData theme,
    String text,
    Color color,
  ) {
    return Text(
      text,
      style: theme.textTheme.displayLarge?.copyWith(
        fontSize: Responsive.value(
          context: context,
          mobile: _mainTextSizeMobile,
          tablet: _mainTextSizeTablet,
          desktop: _mainTextSizeDesktop,
        ),
        fontWeight: FontWeight.bold,
        height: 1.2,
        letterSpacing: 1,
        color: color,
      ),
    );
  }

  Widget _buildRotatingLifeContainer(
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
    ).animate().fadeIn(
          duration: _fadeInDuration,
          delay: const Duration(milliseconds: 200),
        );
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
        child: _buildGradientContainer(theme, isMobile),
      ),
    )
        .animate()
        .scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
          duration: _scaleDuration,
          delay: _scaleDelay,
          curve: Curves.easeOutCubic,
        )
        .fadeIn(
          duration: _scaleDuration,
          delay: _scaleDelay,
        );
  }

  Widget _buildGradientContainer(ThemeData theme, bool isMobile) {
    return Container(
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
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
  // Translations of "Life" in different languages
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

  // Animation constants
  static const _rotationInterval = Duration(seconds: 2);
  static const _fontSizeMobile = 120.0;
  static const _fontSizeDesktop = 200.0;
  static const _lifeTextColor = Color.fromARGB(255, 151, 255, 65);

  // Padding constants
  static const _paddingLeftMobile = 16.0;
  static const _paddingLeftDesktop = 24.0;
  static const _paddingRightMobile = 48.0;
  static const _paddingRightDesktop = 80.0;
  static const _paddingVerticalMobile = 8.0;
  static const _paddingVerticalDesktop = 16.0;

  // Font fallback constants
  static const _fontFamilyFallbacks = [
    'Arial Unicode MS',
    'Lucida Grande',
    'sans-serif',
  ];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_rotationInterval, (_) => _rotateText());
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
        padding: _getPadding(),
        child: Text(
          _lifeTranslations[_currentIndex],
          style: _getTextStyle(),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    );
  }

  EdgeInsets _getPadding() {
    return EdgeInsets.only(
      left: widget.isMobile ? _paddingLeftMobile : _paddingLeftDesktop,
      right: widget.isMobile ? _paddingRightMobile : _paddingRightDesktop,
      top: widget.isMobile ? _paddingVerticalMobile : _paddingVerticalDesktop,
      bottom:
          widget.isMobile ? _paddingVerticalMobile : _paddingVerticalDesktop,
    );
  }

  TextStyle _getTextStyle() {
    return GoogleFonts.notoSans(
      fontSize: widget.isMobile ? _fontSizeMobile : _fontSizeDesktop,
      fontWeight: FontWeight.w300,
      letterSpacing: 2,
      color: _lifeTextColor,
      height: 1.0,
    ).copyWith(
      fontFamilyFallback: _fontFamilyFallbacks,
    );
  }
}
