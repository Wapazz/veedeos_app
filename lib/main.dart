import 'package:flutter/material.dart';
import 'package:veedeos_app/design/theme.dart';
import 'package:veedeos_app/features/videos_gallery/videos_gallery_page.dart';

void main() {
  runApp(const VeedeosApp());
}

class VeedeosApp extends StatelessWidget {
  const VeedeosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veedeos',
      theme: AppTheme.darkTheme,
      home: const VideosGalleryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
