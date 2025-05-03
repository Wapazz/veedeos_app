import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veedeos_app/core/enums/display_mode.dart';
import 'package:veedeos_app/data/repositories/videos_repository.dart';
import 'package:veedeos_app/features/videos_gallery/models/video_item.dart';

part 'videos_gallery_state.dart';

class VideosGalleryViewModel extends Cubit<VideosGalleryState> {
  VideosGalleryViewModel(VideoRepository videoRepository)
      : super(VideosGalleryLoading()) {
    _videoRepository = videoRepository;
    fetchVideos();
  }

  late final VideoRepository _videoRepository;

  Future<void> fetchVideos({String query = '', int page = 1}) async {
    if (page == 1) {
      emit(VideosGalleryLoading());
    } else {
      emit(VideosGalleryPartialLoading.fromState(state, currentPage: page));
    }

    try {
      final List<VideoItem> videos =
          await _videoRepository.searchVideos(query: query, page: page);
      emit(VideosGalleryLoaded(
        currentPage: page,
        query: query,
        videos: state.videos + videos,
        displayMode: state.displayMode,
      ));
    } catch (e) {
      emit(VideosGalleryError('Failed to load videos.'));
    }
  }

  void loadNextPage() {
    final state = this.state;
    if (state is! VideosGalleryLoaded) {
      return;
    }
    fetchVideos(page: state.currentPage + 1, query: state.query);
  }

  void switchDisplayMode(bool value) {
    final state = this.state;
    if (state is! VideosGalleryLoaded) {
      return;
    }
    emit(state.copyWith(displayMode: DisplayMode.fromSwitch(value)));
  }
}
