part of 'videos_gallery_view_model.dart';

sealed class VideosGalleryState {
  final List<VideoItem> videos;
  final DisplayMode displayMode;
  final int currentPage;
  final String query;

  VideosGalleryState({
    required this.videos,
    required this.displayMode,
    required this.currentPage,
    this.query = '',
  });

  bool get displayGrid => displayMode == DisplayMode.grid;
}

final class VideosGalleryLoading extends VideosGalleryState {
  VideosGalleryLoading({
    List<VideoItem> videos = const [],
    int currentPage = 1,
    DisplayMode displayMode = DisplayMode.grid,
  }) : super(
          videos: videos,
          displayMode: displayMode,
          currentPage: currentPage,
          query: '',
        );
}

final class VideosGalleryPartialLoading extends VideosGalleryState {
  VideosGalleryPartialLoading({
    required List<VideoItem> videos,
    required int currentPage,
    required DisplayMode displayMode,
    required String query,
  }) : super(
          videos: videos,
          displayMode: displayMode,
          currentPage: currentPage,
          query: query,
        );

  factory VideosGalleryPartialLoading.fromState(
    VideosGalleryState state, {
    required int currentPage,
  }) {
    return VideosGalleryPartialLoading(
      videos: state.videos,
      displayMode: state.displayMode,
      currentPage: currentPage,
      query: state.query,
    );
  }
}

final class VideosGalleryLoaded extends VideosGalleryState {
  VideosGalleryLoaded({
    required List<VideoItem> videos,
    required int currentPage,
    required DisplayMode displayMode,
    required String query,
  }) : super(
          videos: videos,
          displayMode: displayMode,
          currentPage: currentPage,
          query: query,
        );

  VideosGalleryLoaded copyWith({
    List<VideoItem>? videos,
    DisplayMode? displayMode,
    int? currentPage,
    String? query,
  }) {
    return VideosGalleryLoaded(
      videos: videos ?? this.videos,
      displayMode: displayMode ?? this.displayMode,
      currentPage: currentPage ?? this.currentPage,
      query: query ?? this.query,
    );
  }
}

final class VideosGalleryError extends VideosGalleryState {
  final String error;

  VideosGalleryError(this.error)
      : super(
          videos: [],
          displayMode: DisplayMode.grid,
          currentPage: 1,
        );
}
