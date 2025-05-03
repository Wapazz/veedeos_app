extension DurationExtension on Duration {
  String get toThumbnailString =>
      "$inMinutes:${(inSeconds % 60).toString().padLeft(2, '0')}";
}
