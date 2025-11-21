import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const EviusLifeApp());
}

class EviusLifeApp extends StatelessWidget {
  const EviusLifeApp({super.key});

  static const Color neonAmber = Color(0xFFFFE169);
  static const Color electricCyan = Color(0xFF56F0FF);
  static const Color darkSurface = Color(0xFF0B0D16);
  static const Color darkBackground = Color(0xFF05050A);

  @override
  Widget build(BuildContext context) {
    final darkColorScheme =
        ColorScheme.fromSeed(
          seedColor: neonAmber,
          brightness: Brightness.dark,
        ).copyWith(
          primary: neonAmber,
          onPrimary: Colors.black,
          primaryContainer: neonAmber.withValues(alpha: 0.2),
          onPrimaryContainer: neonAmber,
          secondary: electricCyan,
          onSecondary: Colors.black,
          secondaryContainer: electricCyan.withValues(alpha: 0.2),
          onSecondaryContainer: electricCyan,
          tertiary: electricCyan,
          onTertiary: Colors.black,
          tertiaryContainer: electricCyan.withValues(alpha: 0.2),
          onTertiaryContainer: electricCyan,
          surface: darkSurface,
          onSurface: Colors.white,
          surfaceContainerHighest: const Color(0xFF1A1D2A),
          surfaceContainer: const Color(0xFF11182A),
          surfaceContainerLow: darkSurface,
          surfaceContainerLowest: darkBackground,
          outline: Colors.white.withValues(alpha: 0.12),
          outlineVariant: Colors.white.withValues(alpha: 0.08),
          shadow: Colors.black,
          scrim: Colors.black,
          inverseSurface: Colors.white,
          onInverseSurface: Colors.black,
          inversePrimary: electricCyan,
          surfaceTint: Colors.transparent,
        );

    return MaterialApp(
      title: 'evius.life',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        scaffoldBackgroundColor: darkBackground,
        textTheme: GoogleFonts.poppinsTextTheme(
          Typography.whiteCupertino.apply(
            displayColor: Colors.white,
            bodyColor: Colors.white70,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          color: darkColorScheme.surfaceContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      body: SizedBox.expand(
        child: NeonGradientBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: isMobile ? 24 : 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
                  child: Header(),
                ),
                SizedBox(height: isMobile ? 60 : 120),
                const HeroSection(),
                SizedBox(height: isMobile ? 80 : 160),
                const PhilosophyAndPrinciplesSection(),
                SizedBox(height: isMobile ? 80 : 160),
                const WorkSection(),
                SizedBox(height: isMobile ? 80 : 160),
                const Footer(),
                SizedBox(height: isMobile ? 40 : 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.asset(
              'lib/assets/eviuslife.png',
              fit: BoxFit.cover,
              width: 54,
              height: 54,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'evius.life',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
      child: Column(
        children: [
          Text(
                'I think we are missing\nthe beauty in our digital lives.',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayLarge?.copyWith(
                  fontSize: isMobile
                      ? 36
                      : isTablet
                      ? 56
                      : 80,
                  fontWeight: FontWeight.w300,
                  height: 1.1,
                  letterSpacing: -1,
                  color: theme.colorScheme.onSurface,
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 100.ms)
              .slideY(begin: -0.2, end: 0, duration: 600.ms, delay: 100.ms),
          SizedBox(height: isMobile ? 60 : 100),
          // Large visual element
          Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                color: theme.colorScheme.primaryContainer,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 900,
                    maxHeight: isMobile ? 400 : 600,
                  ),
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
                          const SizedBox(height: 24),
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
              )
              .animate()
              .scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1, 1),
                duration: 800.ms,
                delay: 300.ms,
                curve: Curves.easeOutCubic,
              )
              .fadeIn(duration: 800.ms, delay: 300.ms),
          /*SizedBox(height: isMobile ? 40 : 60),
          Container(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              'I am rethinking the digital tools I use daily.\nMaking something beautiful and useful.',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.8,
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}

class PhilosophyAndPrinciplesSection extends StatelessWidget {
  const PhilosophyAndPrinciplesSection({super.key});

  static final principles = [
    (
      'My Device',
      'Native, respectful tools that work the way you expect.',
      Icons.phone_iphone_outlined,
    ),
    (
      'My Data',
      'Your data stays on your device. No cloud, no accounts, no selling.',
      Icons.storage_outlined,
    ),
    (
      'My Privacy',
      'Privacy by default. No analytics, no tracking, no collection.',
      Icons.lock_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                      'Digital tools have become soulless.',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile
                            ? 32
                            : isTablet
                            ? 40
                            : 48,
                        color: theme.colorScheme.onSurface,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 200.ms)
                    .slideX(
                      begin: -0.2,
                      end: 0,
                      duration: 600.ms,
                      delay: 200.ms,
                    ),
                SizedBox(height: isMobile ? 24 : 32),
                Text(
                      'I build tools that respect your attention. Every pixel is intentional. '
                      'This is slow, deliberate work. Built with care, not speed.',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                        height: 1.8,
                        fontSize: isMobile ? 16 : 18,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 400.ms)
                    .slideX(
                      begin: -0.2,
                      end: 0,
                      duration: 600.ms,
                      delay: 400.ms,
                    ),
              ],
            ),
          ),
          SizedBox(width: isMobile ? 0 : 60, height: isMobile ? 40 : 0),
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...principles.asMap().entries.map((entry) {
                  final index = entry.key;
                  final principle = entry.value;
                  final useSecondary = index == 1; // Middle item uses secondary
                  return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < principles.length - 1
                              ? (isMobile ? 16 : 24)
                              : 0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: useSecondary
                                    ? theme.colorScheme.secondaryContainer
                                    : theme.colorScheme.primaryContainer,
                              ),
                              child: Icon(
                                principle.$3,
                                color: useSecondary
                                    ? theme.colorScheme.onSecondaryContainer
                                    : theme.colorScheme.onPrimaryContainer,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: isMobile ? 16 : 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    principle.$1,
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: isMobile ? 18 : 20,
                                          color: theme.colorScheme.onSurface,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    principle.$2,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurface
                                          .withValues(alpha: 0.7),
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .animate()
                      .fadeIn(
                        duration: 500.ms,
                        delay: (600 + (entry.key * 150)).ms,
                      )
                      .slideX(
                        begin: 0.2,
                        end: 0,
                        duration: 500.ms,
                        delay: (600 + (entry.key * 150)).ms,
                      );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  static final projects = [
    (
      'Mood Tracker',
      'Track your emotional landscape with intention. No judgment, just awareness.',
      Icons.favorite_outline,
      'In Progress',
    ),
    (
      'Memory Surfer',
      'Navigate your memories with ease. Your past, beautifully organized.',
      Icons.auto_stories_outlined,
      'Concept',
    ),
    (
      'Checklists',
      'Simple, focused task management. No complexity, just clarity.',
      Icons.checklist_outlined,
      'Coming Soon',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width < 900;
    final crossAxisCount = isMobile
        ? 1
        : isTablet
        ? 2
        : 3;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
      child: Column(
        children: [
          Text(
                'What I\'m Building',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: isMobile
                      ? 32
                      : isTablet
                      ? 40
                      : 48,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: -0.2, end: 0, duration: 600.ms),
          SizedBox(height: isMobile ? 16 : 24),
          Text(
                'Tools I want to use. Built slowly, with care.',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: -0.1, end: 0, duration: 600.ms, delay: 200.ms),
          SizedBox(height: isMobile ? 40 : 60),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: isMobile ? 400 : 480,
              crossAxisSpacing: isMobile ? 24 : 32,
              mainAxisSpacing: isMobile ? 24 : 32,
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              final useSecondary = index == 1; // Middle project uses secondary
              return Card(
                    elevation: 0,
                    color: theme.colorScheme.surfaceContainer,
                    child: Padding(
                      padding: EdgeInsets.all(isMobile ? 24 : 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Visual mockup
                          Expanded(
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: Center(
                                child: Icon(
                                  project.$3,
                                  size: isMobile ? 60 : 80,
                                  color: useSecondary
                                      ? theme.colorScheme.secondary
                                      : theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: isMobile ? 20 : 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  project.$1,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Chip(
                                label: Text(
                                  project.$4,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                backgroundColor:
                                    theme.colorScheme.surfaceContainerHighest,
                                side: BorderSide(
                                  color: theme.colorScheme.outline,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            project.$2,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: (400 + (index * 150)).ms)
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    end: const Offset(1, 1),
                    duration: 600.ms,
                    delay: (400 + (index * 150)).ms,
                    curve: Curves.easeOutCubic,
                  );
            },
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
      child: Column(
        children: [
          Divider(color: theme.colorScheme.outline, thickness: 1),
          SizedBox(height: isMobile ? 48 : 64),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 24,
                color: theme.colorScheme.secondary.withValues(alpha: 0.8),
              ),
              const SizedBox(width: 8),
              Text(
                'Made with care by ',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'Lokesh Upputri',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 32 : 40),
          Wrap(
            spacing: isMobile ? 20 : 32,
            runSpacing: isMobile ? 16 : 20,
            alignment: WrapAlignment.center,
            children: [
              _FooterLink('Contact', Icons.mail_outline),
              _FooterLink('Privacy', Icons.lock_outline),
              _FooterLink('Notes', Icons.article_outlined),
            ],
          ),
          SizedBox(height: isMobile ? 48 : 64),
        ],
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink(this.label, this.icon);

  final String label;
  final IconData icon;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _isHovered
              ? theme.colorScheme.surfaceContainerHighest
              : Colors.transparent,
          border: Border.all(
            color: _isHovered
                ? (widget.label == 'Privacy'
                      ? theme.colorScheme.secondary.withValues(alpha: 0.3)
                      : theme.colorScheme.primary.withValues(alpha: 0.3))
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              size: 16,
              color: _isHovered
                  ? (widget.label == 'Privacy'
                        ? theme.colorScheme.secondary
                        : theme.colorScheme.primary)
                  : theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _isHovered
                    ? (widget.label == 'Privacy'
                          ? theme.colorScheme.secondary
                          : theme.colorScheme.primary)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                fontWeight: _isHovered ? FontWeight.w500 : FontWeight.w400,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NeonGradientBackground extends StatelessWidget {
  const NeonGradientBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomPaint(
      painter: _HaloPainter(theme),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLowest,
        ),
        child: child,
      ),
    );
  }
}

class _HaloPainter extends CustomPainter {
  const _HaloPainter(this.theme);

  final ThemeData theme;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

    paint.color = theme.colorScheme.primary.withValues(alpha: 0.2);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.3), 220, paint);

    paint.color = theme.colorScheme.secondary.withValues(alpha: 0.2);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.5), 260, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
