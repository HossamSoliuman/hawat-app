import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../format/format.dart';
import '../theme/tokens.dart';

/// A square avatar (sharp, like everything else): the photo, or the initials.
class HudAvatar extends StatelessWidget {
  const HudAvatar({super.key, required this.name, this.url, this.size = 40});

  final String name;
  final String? url;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = HawatColors.of(context);
    final initials = Container(
      width: size,
      height: size,
      color: c.primary,
      alignment: Alignment.center,
      child: Text(
        Fmt.initials(name),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: c.onPrimary, fontSize: size * .36),
      ),
    );
    if (url == null || url!.isEmpty) return initials;
    return SizedBox.square(
      dimension: size,
      child: CachedNetworkImage(
        imageUrl: url!,
        fit: BoxFit.cover,
        placeholder: (_, _) => initials,
        errorWidget: (_, _, _) => initials,
      ),
    );
  }
}
