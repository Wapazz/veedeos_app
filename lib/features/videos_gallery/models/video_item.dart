class VideoItem {
  final String videoUrl;
  final String thumbnailUrl;
  final Duration duration;
  final String author;
  final String authorAvatarUrl;
  final List<String> tagList;

  VideoItem({
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.duration,
    required this.author,
    required this.authorAvatarUrl,
    this.tagList = const [],
  });
}
