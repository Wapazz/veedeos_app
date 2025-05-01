import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:veedeos_app/core/secret.dart';
import 'package:veedeos_app/data/api_models/pix_video_response.dart';

class VideoApiService {
  VideoApiService();

  Future<PixVideoResponse> fetchVideos({
    String? query,
    int page = 1,
  }) async {
    final Uri uri = Uri.parse(
        'https://pixabay.com/api/videos/?key=$pixabayApiKey&q=$query');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return PixVideoResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load videos: ${response.statusCode}');
    }
  }
}
