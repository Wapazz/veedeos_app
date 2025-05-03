import 'package:flutter/material.dart';
import 'package:veedeos_app/core/extensions/duration.dart';
import 'package:veedeos_app/design/colors.dart';
import 'package:veedeos_app/design/typography.dart';

class VideoCard extends StatelessWidget {
  const VideoCard(
      {super.key,
      required this.thumbnailUrl,
      required this.duration,
      required this.author,
      required this.authorAvatarUrl});

  final String thumbnailUrl;
  final Duration duration;
  final String author;
  final String authorAvatarUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(width: 4),
              CircleAvatar(
                backgroundImage: NetworkImage(authorAvatarUrl),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  author,
                  style: AppTypography.body1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight * 0.7,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.black.withOpacity(0.5),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      duration.toThumbnailString,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
