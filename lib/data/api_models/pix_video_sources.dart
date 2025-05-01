import 'package:veedeos_app/data/api_models/pix_video_file.dart';

class PixVideoSources {
  final PixVideoFile large;
  final PixVideoFile medium;
  final PixVideoFile small;
  final PixVideoFile tiny;

  PixVideoSources({
    required this.large,
    required this.medium,
    required this.small,
    required this.tiny,
  });

  factory PixVideoSources.fromJson(Map<String, dynamic> json) {
    return PixVideoSources(
      large: PixVideoFile.fromJson(json['large']),
      medium: PixVideoFile.fromJson(json['medium']),
      small: PixVideoFile.fromJson(json['small']),
      tiny: PixVideoFile.fromJson(json['tiny']),
    );
  }

  Map<String, dynamic> toJson() => {
        'large': large.toJson(),
        'medium': medium.toJson(),
        'small': small.toJson(),
        'tiny': tiny.toJson(),
      };
}
