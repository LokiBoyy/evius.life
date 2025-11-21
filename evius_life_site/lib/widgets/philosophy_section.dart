import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';

/// Philosophy and principles section
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
    final isMobile = Responsive.isMobile(context);

    return Padding(
      padding: Responsive.padding(context),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: _buildPhilosophyText(context, theme, isMobile),
          ),
          SizedBox(
            width: isMobile ? 0 : 60,
            height: isMobile ? AppConstants.spacingXL : 0,
          ),
          Flexible(
            flex: 1,
            child: _buildPrinciplesList(context, theme, isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildPhilosophyText(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              'Digital tools have become soulless.',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: Responsive.value(
                  context: context,
                  mobile: 32.0,
                  tablet: 40.0,
                  desktop: 48.0,
                ),
                color: theme.colorScheme.onSurface,
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 200.ms)
            .slideX(begin: -0.2, end: 0, duration: 600.ms, delay: 200.ms),
        SizedBox(
          height: isMobile ? AppConstants.spacingMD : AppConstants.spacingLG,
        ),
        Text(
              'I build tools that respect your attention. Every pixel is intentional. '
              'This is slow, deliberate work. Built with care, not speed.',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.8,
                fontSize: isMobile ? 16 : 18,
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: 400.ms)
            .slideX(begin: -0.2, end: 0, duration: 600.ms, delay: 400.ms),
      ],
    );
  }

  Widget _buildPrinciplesList(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...principles.asMap().entries.map((entry) {
          final index = entry.key;
          final principle = entry.value;
          final useSecondary = index == 1; // Middle item uses secondary
          return Padding(
                padding: EdgeInsets.only(
                  bottom: index < principles.length - 1
                      ? (isMobile
                            ? AppConstants.spacingSM
                            : AppConstants.spacingMD)
                      : 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppConstants.spacingSM),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppConstants.spacingSM,
                        ),
                        color: useSecondary
                            ? theme.colorScheme.secondaryContainer
                            : theme.colorScheme.primaryContainer,
                      ),
                      child: Icon(
                        principle.$3,
                        color: useSecondary
                            ? theme.colorScheme.onSecondaryContainer
                            : theme.colorScheme.onPrimaryContainer,
                        size: AppConstants.spacingMD,
                      ),
                    ),
                    SizedBox(
                      width: isMobile
                          ? AppConstants.spacingSM
                          : AppConstants.spacingLG,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            principle.$1,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: isMobile ? 18 : 20,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            principle.$2,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
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
              .fadeIn(duration: 500.ms, delay: (600 + (entry.key * 150)).ms)
              .slideX(
                begin: 0.2,
                end: 0,
                duration: 500.ms,
                delay: (600 + (entry.key * 150)).ms,
              );
        }).toList(),
      ],
    );
  }
}
