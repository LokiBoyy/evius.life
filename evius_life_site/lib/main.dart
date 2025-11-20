import 'package:flutter/material.dart';

void main() {
  runApp(const EviusLifeApp());
}

class EviusLifeApp extends StatelessWidget {
  const EviusLifeApp({super.key});

  static const Color neonAmber = Color(0xFFFFE169);
  static const Color electricCyan = Color(0xFF56F0FF);
  static final Color deepSpace = Colors.blueGrey.shade900;

  @override
  Widget build(BuildContext context) {
    final baseScheme = ColorScheme.fromSeed(
      seedColor: neonAmber,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      title: 'evius.life',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: baseScheme.copyWith(
          primary: neonAmber,
          inversePrimary: electricCyan,
          secondary: electricCyan,
          surfaceTint: Colors.transparent,
          surface: const Color(0xFF0B0D16),
        ),
        scaffoldBackgroundColor: const Color(0xFF05050A),
        textTheme: Typography.whiteCupertino.apply(
          displayColor: Colors.white,
          bodyColor: Colors.white70,
        ),
        fontFamily: 'SF Pro Display',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            backgroundColor: neonAmber,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
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
    final theme = Theme.of(context);
    return Scaffold(
      body: SizedBox.expand(
        child: NeonGradientBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Header(theme: theme),
                ),
                const SizedBox(height: 40),
                const HeroSection(),
                const SizedBox(height: 80),
                const FeatureSection(),
                const SizedBox(height: 80),
                const CraftSection(),
                const SizedBox(height: 80),
                const ShowcaseSection(),
                const SizedBox(height: 80),
                const PraiseSection(),
                const SizedBox(height: 80),
                const CallToActionSection(),
                const SizedBox(height: 60),
                const Footer(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final textStyle = theme.textTheme.bodyLarge;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 54,
              width: 54,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFE169), Color(0xFF56F0FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3356F0FF),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.asset(
                  'lib/assets/eviuslife.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'evius.life',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        Row(
          children: [
            _HeaderLink(label: 'Vision', textStyle: textStyle),
            _HeaderLink(label: 'Studio', textStyle: textStyle),
            _HeaderLink(label: 'Experiments', textStyle: textStyle),
            _HeaderLink(label: 'Notes', textStyle: textStyle),
            const SizedBox(width: 24),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF56F0FF), width: 1.2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: const Text('Join early list'),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeaderLink extends StatelessWidget {
  const _HeaderLink({required this.label, required this.textStyle});

  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          label,
          style: textStyle?.copyWith(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompact = MediaQuery.of(context).size.width < 900;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Flex(
        direction: isCompact ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            fit: isCompact ? FlexFit.loose : FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Text('Toolsmith • Design-first • Habit Lab'),
                ),
                const SizedBox(height: 24),
                Text(
                  'Reimagining everyday tools\nuntil they feel alive.',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontSize: isCompact ? 48 : 64,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'evius.life is a digital atelier by Lokesh Uupputri. '
                  'Every experience is crafted with brutal clarity, neon warmth, '
                  'and a bias for delightful automation. Habit tracking, planners, '
                  'and dashboards are reinvented from first principles.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white70,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.apple),
                      label: const Text('iOS preview placeholder'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.android),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white24),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 18,
                        ),
                      ),
                      label: const Text('Android preview placeholder'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48, height: 48),
          Flexible(
            flex: 1,
            fit: isCompact ? FlexFit.loose : FlexFit.tight,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFE169), Color(0xFF56F0FF)],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x6656F0FF),
                      blurRadius: 60,
                      offset: Offset(0, 20),
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.black.withValues(alpha: 0.9),
                  ),
                  child: Center(
                    child: Text(
                      'App mock placeholder',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  static final features = [
    (
      'Habit canvases',
      'Tile-based grids visualize streaks, resets, and ritual intensity.',
      Icons.grid_view_rounded,
    ),
    (
      'Multi-completions',
      'Track micro wins throughout the day with friction-less taps.',
      Icons.touch_app,
    ),
    (
      'Widgets everywhere',
      'Home-screen, desktop, and watch widgets stay perfectly synced.',
      Icons.widgets_outlined,
    ),
    (
      'Ritual reminders',
      'Ambient nudges blend neon glow with calm haptics to respect focus.',
      Icons.notifications_active_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 700
        ? 1
        : width < 1100
        ? 2
        : 4;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools that feel cinematic',
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Text(
            'Material 3 bones, evius neon skin. Everything is intentionally over-designed.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: features.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: 200,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            itemBuilder: (context, index) {
              final feature = features[index];
              return _FeatureCard(
                title: feature.$1,
                subtitle: feature.$2,
                icon: feature.$3,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF0B0D16), Color(0xFF11182A)],
        ),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFFFE169), size: 32),
          const Spacer(),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(subtitle),
        ],
      ),
    );
  }
}

class CraftSection extends StatelessWidget {
  const CraftSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white10),
          gradient: const LinearGradient(
            colors: [Color(0x33FFE169), Color(0x330B0D16)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is evius.life?',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'A studio by Lokesh Uupputri for people obsessed with intentional living. '
              'He engineers small, opinionated tools that turn routine tracking into sensory experiences. '
              'Utility, animation, and craft sit at the same table—because beauty isn’t optional.',
              style: theme.textTheme.titleMedium?.copyWith(height: 1.7),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 24,
              runSpacing: 16,
              children: const [
                _Pill(text: 'Beautiful defaults'),
                _Pill(text: 'Automation-minded'),
                _Pill(text: 'Multi-platform ready'),
                _Pill(text: 'Design-led development'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      label: Text(text),
      backgroundColor: Colors.white12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
    );
  }
}

class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.of(context).size.width < 900;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Flex(
        direction: isCompact ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: isCompact
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: isCompact ? FlexFit.loose : FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily OS crafted with neon calm.',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Placeholder timeline: widgets, streak intelligence, cross-device syncing. '
                  'Each release ships with cinematic motion and studio-grade iconography.',
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _TimelineTile(label: 'Habits OS • concept deck 01'),
                    _TimelineTile(label: 'Flowboard • whitepaper placeholder'),
                    _TimelineTile(label: 'Mood loops • sonic exploration'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48, height: 48),
          Flexible(
            fit: isCompact ? FlexFit.loose : FlexFit.tight,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0x22101830), Color(0x3356F0FF)],
                  ),
                ),
                child: const Center(child: Text('Video / gallery placeholder')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  const _TimelineTile({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: const Icon(Icons.auto_graph, color: Color(0xFF56F0FF)),
      title: Text(label),
      subtitle: const Text('Launching soon • placeholder copy'),
    );
  }
}

class PraiseSection extends StatelessWidget {
  const PraiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Future praise from the community',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: List.generate(
              3,
              (index) => SizedBox(
                width: 320,
                child: Card(
                  color: const Color(0xFF0B0D16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: const BorderSide(color: Colors.white12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.format_quote, color: Colors.white54),
                        const SizedBox(height: 16),
                        Text(
                          '“Placeholder testimonial about how neon interfaces made habits addictive.”',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        const Text('Beta voice • Role pending'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallToActionSection extends StatelessWidget {
  const CallToActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFE169), Color(0xFF56F0FF)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x4456F0FF),
              blurRadius: 40,
              offset: Offset(0, 20),
            ),
          ],
        ),
        child: Flex(
          direction: MediaQuery.of(context).size.width < 900
              ? Axis.vertical
              : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Join the build log.',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Drop your email to get early invites, behind-the-scenes drops, and Figma files.',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24, height: 24),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'you@placeholder.dev',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text('Notify me'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(color: Colors.white12),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('© evius.life — crafted by Lokesh Uupputri'),
              Text('Privacy • Terms • Contact placeholder'),
            ],
          ),
        ],
      ),
    );
  }
}

class NeonGradientBackground extends StatelessWidget {
  const NeonGradientBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HaloPainter(),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFF05050A)),
        child: child,
      ),
    );
  }
}

class _HaloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 80);

    paint.color = const Color(0x33FFE169);
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.3), 220, paint);

    paint.color = const Color(0x334DE1FF);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.5), 260, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
