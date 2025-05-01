import 'package:veedeos_app/data/api_models/pix_video_sources.dart';

class PixVideoHit {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final int duration;
  final PixVideoSources videos;
  final int views;
  final int downloads;
  final int likes;
  final int comments;
  final int userId;
  final String user;
  final String userImageURL;

  PixVideoHit({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.duration,
    required this.videos,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageURL,
  });

  factory PixVideoHit.fromJson(Map<String, dynamic> json) {
    return PixVideoHit(
      id: json['id'],
      pageURL: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      duration: json['duration'],
      videos: PixVideoSources.fromJson(json['videos']),
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      userId: json['user_id'],
      user: json['user'],
      userImageURL: json['userImageURL'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'pageURL': pageURL,
        'type': type,
        'tags': tags,
        'duration': duration,
        'videos': videos.toJson(),
        'views': views,
        'downloads': downloads,
        'likes': likes,
        'comments': comments,
        'user_id': userId,
        'user': user,
        'userImageURL': userImageURL,
      };
}
