import 'package:flutter/material.dart';
import '../config/constants.dart';

/// Application header widget
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.asset(
              AppConstants.logoPath,
              fit: BoxFit.cover,
              width: 54,
              height: 54,
            ),
          ),
        ),
        const SizedBox(width: AppConstants.spacingSM),
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
