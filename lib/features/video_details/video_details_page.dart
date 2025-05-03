import 'package:flutter/material.dart';
import 'package:veedeos_app/design/typography.dart';
import 'package:veedeos_app/features/video_details/widgets/tag_chip.dart';
import 'package:veedeos_app/features/videos_gallery/models/video_item.dart';

class VideoDetailsPage extends StatelessWidget {
  const VideoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoItem video =
        ModalRoute.of(context)?.settings.arguments as VideoItem;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Video'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.network(
                video.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(video.authorAvatarUrl),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          video.author,
                          style: AppTypography.headline1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (video.tagList.isNotEmpty) ...[
                    const Text(
                      "Tags",
                      style: AppTypography.headline2,
                      textAlign: TextAlign.start,
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: video.tagList
                          .map((tag) => TagChip(tag: tag))
                          .toList(),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
