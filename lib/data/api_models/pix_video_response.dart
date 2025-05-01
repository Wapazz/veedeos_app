import 'package:veedeos_app/data/api_models/pix_video_hit.dart';

class PixVideoResponse {
  final int total;
  final int totalHits;
  final List<PixVideoHit> hits;

  PixVideoResponse({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  factory PixVideoResponse.fromJson(Map<String, dynamic> json) {
    return PixVideoResponse(
      total: json['total'],
      totalHits: json['totalHits'],
      hits: (json['hits'] as List)
          .map((item) => PixVideoHit.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'totalHits': totalHits,
        'hits': hits.map((e) => e.toJson()).toList(),
      };
}
