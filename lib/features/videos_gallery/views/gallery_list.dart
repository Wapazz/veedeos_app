import 'package:flutter/material.dart';
import 'package:veedeos_app/core/enums/display_mode.dart';
import 'package:veedeos_app/core/router.dart';
import 'package:veedeos_app/design/components/empty_state.dart';
import 'package:veedeos_app/features/videos_gallery/models/video_item.dart';
import 'package:veedeos_app/features/videos_gallery/widgets/video_card.dart';

class GalleryList extends StatelessWidget {
  const GalleryList({
    super.key,
    required this.videos,
    required this.displayMode,
  });

  final List<VideoItem> videos;
  final DisplayMode displayMode;

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return const EmptyState();
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: GridView.builder(
        key: ValueKey<int>(displayMode.crossAxisCount),
        padding: const EdgeInsets.only(top: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          crossAxisCount: displayMode.crossAxisCount,
          childAspectRatio: displayMode.aspectRation,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.details.route,
                arguments: video,
              );
            },
            child: VideoCard(
              thumbnailUrl: video.thumbnailUrl,
              duration: video.duration,
              author: video.author,
              authorAvatarUrl: video.authorAvatarUrl,
            ),
          );
        },
      ),
    );
  }
}
