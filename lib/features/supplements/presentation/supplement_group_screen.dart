import 'package:flutter/material.dart';

import '../data/supplement_profiles.dart';
import 'supplement_detail_screen.dart';

class SupplementGroupScreen extends StatelessWidget {
  const SupplementGroupScreen({
    super.key,
    required this.group,
    required this.subtitle,
    required this.icon,
  });

  final String group;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profiles =
        supplementProfiles.where((profile) => profile.group == group).toList();

    return Scaffold(
      appBar: AppBar(title: Text(group)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 34,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    subtitle,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          if (profiles.isEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  'This section is reserved for verified, product-specific records. New profiles will be added without mixing them with the core vitamin/mineral library.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ),
            )
          else
            for (final profile in profiles) ...[
              Card(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            SupplementDetailScreen(profile: profile),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.medication_liquid_outlined),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                profile.subtitle,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                profile.howToTakeEn,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w700,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
        ],
      ),
    );
  }
}
