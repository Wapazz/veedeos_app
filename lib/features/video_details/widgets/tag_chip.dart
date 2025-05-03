import 'package:flutter/material.dart';
import 'package:veedeos_app/design/colors.dart';
import 'package:veedeos_app/design/typography.dart';

class TagChip extends StatelessWidget {
  const TagChip({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(tag),
      backgroundColor: AppColors.accentPrimary,
      labelStyle: AppTypography.tag,
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
