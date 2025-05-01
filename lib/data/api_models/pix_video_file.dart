class PixVideoFile {
  final String url;
  final int width;
  final int height;
  final int size;
  final String thumbnail;

  PixVideoFile({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.thumbnail,
  });

  factory PixVideoFile.fromJson(Map<String, dynamic> json) {
    return PixVideoFile(
      url: json['url'],
      width: json['width'],
      height: json['height'],
      size: json['size'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
        'size': size,
        'thumbnail': thumbnail,
      };
}
