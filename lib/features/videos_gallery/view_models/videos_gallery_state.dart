part of 'videos_gallery_view_model.dart';

sealed class VideosGalleryState {
  bool get displayGrid => true;
}

final class VideosGalleryInitial extends VideosGalleryState {}

final class VideosGalleryLoading extends VideosGalleryState {}

final class VideosGalleryLoaded extends VideosGalleryState {
  final List<VideoItem> videos;
  final DisplayMode displayMode;

  @override
  bool get displayGrid => displayMode == DisplayMode.grid;

  VideosGalleryLoaded(this.videos, {this.displayMode = DisplayMode.grid});

  VideosGalleryLoaded copyWith({
    List<VideoItem>? videos,
    DisplayMode? displayMode,
  }) {
    return VideosGalleryLoaded(
      videos ?? this.videos,
      displayMode: displayMode ?? this.displayMode,
    );
  }
}

final class VideosGalleryError extends VideosGalleryState {
  final String error;

  VideosGalleryError(this.error);
}
