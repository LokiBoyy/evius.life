import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/responsive.dart';
import '../config/constants.dart';

/// Work section displaying projects
class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  static final projects = [
    (
      'Agape - Mood Tracker',
      'Track your emotional landscape with intention. No judgment, just awareness.',
      Icons.favorite_outline,
      'In Progress',
    ),
    (
      'Anamnesis - Memories',
      'Navigate your memories with ease. Your past, beautifully organized.',
      Icons.auto_stories_outlined,
      'Concept',
    ),
    (
      'Axia - Checklists',
      'Simple, focused task management. No complexity, just clarity.',
      Icons.checklist_outlined,
      'Coming Soon',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);
    final crossAxisCount = Responsive.value(
      context: context,
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );

    return Padding(
      padding: Responsive.padding(context),
      child: Column(
        children: [
          Text(
            'What I\'m Building',
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
            textAlign: TextAlign.center,
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: -0.2, end: 0, duration: 600.ms),
          SizedBox(
            height: isMobile ? AppConstants.spacingSM : AppConstants.spacingMD,
          ),
          Text(
            '>> Our tools should respect our attention <<\n >> Our technologies should reflect our humanity <<',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 200.ms)
              .slideY(begin: -0.1, end: 0, duration: 600.ms, delay: 200.ms),
          SizedBox(height: isMobile ? AppConstants.spacingXL : 60),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: isMobile ? 400 : 480,
              crossAxisSpacing:
                  isMobile ? AppConstants.spacingMD : AppConstants.spacingLG,
              mainAxisSpacing:
                  isMobile ? AppConstants.spacingMD : AppConstants.spacingLG,
            ),
            itemBuilder: (context, index) {
              return _buildProjectCard(context, theme, isMobile, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    ThemeData theme,
    bool isMobile,
    int index,
  ) {
    final project = projects[index];
    final useSecondary = index == 1; // Middle project uses secondary

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainer,
      clipBehavior: Clip.none,
      child: Padding(
        padding: EdgeInsets.all(
          isMobile ? AppConstants.spacingMD : AppConstants.spacingLG,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visual mockup
            Expanded(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.spacingLG,
                  ),
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
            SizedBox(
              height:
                  isMobile ? AppConstants.spacingLG : AppConstants.spacingMD,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    project.$1,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(width: AppConstants.spacingSM),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacingSM,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  child: Text(
                    project.$4,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacingSM),
            Text(
              project.$2,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: (400 + (index * 150)).ms).scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
          duration: 600.ms,
          delay: (400 + (index * 150)).ms,
          curve: Curves.easeOutCubic,
        );
  }
}
