import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:veedeos_app/data/repositories/videos_repository.dart';
import 'package:veedeos_app/features/video_details/video_details_page.dart';
import 'package:veedeos_app/features/videos_gallery/videos_gallery_page.dart';
import 'package:veedeos_app/features/videos_gallery/view_models/videos_gallery_view_model.dart';

enum AppRoutes {
  gallery,
  details,
  ;

  String get route {
    return switch (this) {
      AppRoutes.gallery => '/',
      AppRoutes.details => '/details',
    };
  }
}

class AppRouter {
  static String initialRoute = AppRoutes.gallery.route;

  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.gallery.route: (context) => VideosGalleryPage(
          viewModel: VideosGalleryViewModel(GetIt.I<VideoRepository>()),
        ),
    AppRoutes.details.route: (context) => const VideoDetailsPage(),
  };
}
