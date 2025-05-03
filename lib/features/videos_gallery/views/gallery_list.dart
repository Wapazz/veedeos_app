import 'package:flutter/material.dart';
import 'package:veedeos_app/core/enums/display_mode.dart';
import 'package:veedeos_app/core/router.dart';
import 'package:veedeos_app/design/components/empty_state.dart';
import 'package:veedeos_app/features/videos_gallery/models/video_item.dart';
import 'package:veedeos_app/features/videos_gallery/widgets/video_card.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({
    super.key,
    required this.videos,
    required this.displayMode,
    required this.onLoadMore,
  });

  final List<VideoItem> videos;
  final DisplayMode displayMode;
  final VoidCallback onLoadMore;

  @override
  State<GalleryList> createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - 200) {
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videos.isEmpty) {
      return const EmptyState();
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: GridView.builder(
        key: ValueKey<int>(widget.displayMode.crossAxisCount),
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          crossAxisCount: widget.displayMode.crossAxisCount,
          childAspectRatio: widget.displayMode.aspectRation,
        ),
        itemCount: widget.videos.length,
        itemBuilder: (context, index) {
          final video = widget.videos[index];
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

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}
