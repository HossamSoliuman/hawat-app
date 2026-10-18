import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'stat_tile.dart';

/// A section heading: an icon box, the title, and a hairline that fills the
/// rest of the row and fades out. An optional action sits at the end.
class SectionHead extends StatelessWidget {
  const SectionHead({super.key, required this.title, required this.icon, this.action, this.onAction});

  final String title;
  final IconData icon;
  final String? action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          ToneIcon(icon: icon, size: 28, iconSize: 15),
          const SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [c.border, c.border.withValues(alpha: 0)],
                ),
              ),
            ),
          ),
          if (action != null) ...[
            const SizedBox(width: 4),
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(
                minimumSize: const Size(48, 40),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                textStyle: Theme.of(context).textTheme.labelMedium,
              ),
              child: Text(action!),
            ),
          ],
        ],
      ),
    );
  }
}
