import 'package:veedeos_app/data/api_models/pix_video_response.dart';
import 'package:veedeos_app/data/services/videos_api_service.dart';
import 'package:veedeos_app/features/videos_gallery/models/video_item.dart';

class VideoRepository {
  final VideoApiService _api;

  VideoRepository({required VideoApiService api}) : _api = api;

  Future<List<VideoItem>> searchVideos(
      {String query = '', int page = 1}) async {
    final PixVideoResponse videos =
        await _api.fetchVideos(query: query, page: page);
    return videos.hits.map((video) {
      return VideoItem(
        videoUrl: video.videos.medium.url,
        thumbnailUrl: video.videos.medium.thumbnail,
        duration: Duration(seconds: video.duration),
        author: video.user,
        authorAvatarUrl: video.userImageURL,
        tagList: video.tags.isEmpty ? [] : video.tags.split(', '),
      );
    }).toList();
  }
}
