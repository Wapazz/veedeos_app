import 'package:flutter/material.dart';
import 'package:veedeos_app/core/enums/display_mode.dart';
import 'package:veedeos_app/design/components/empty_state.dart';
import 'package:veedeos_app/features/videos_gallery/models/video_item.dart';

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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: displayMode.crossAxisCount,
          childAspectRatio: 16 / 9,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return GestureDetector(
            onTap: () {},
            child: Image.network(video.thumbnailUrl),
          );
        },
      ),
    );
  }
}
