import 'package:flutter/material.dart';
import 'package:veedeos_app/design/typography.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No videos available.',
        style: AppTypography.body1,
      ),
    );
  }
}
