import 'package:flutter/material.dart';
import 'package:veedeos_app/design/colors.dart';
import 'package:veedeos_app/design/typography.dart';

class GalleryError extends StatelessWidget {
  const GalleryError(
      {super.key, required this.onRetry, required this.errorMessage});

  final VoidCallback onRetry;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 76,
            color: AppColors.error,
          ),
          const SizedBox(height: 20),
          Text(
            errorMessage,
            style: AppTypography.body1.copyWith(color: AppColors.error),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
