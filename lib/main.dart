import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:veedeos_app/core/router.dart';
import 'package:veedeos_app/data/repositories/videos_repository.dart';
import 'package:veedeos_app/data/services/videos_api_service.dart';
import 'package:veedeos_app/design/theme.dart';

void main() {
  registerServices();
  runApp(const VeedeosApp());
}

class VeedeosApp extends StatelessWidget {
  const VeedeosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veedeos',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}

void registerServices() {
  final VideoApiService videoApiService = VideoApiService();

  GetIt.I.registerSingleton<VideoRepository>(
    VideoRepository(api: videoApiService),
  );
}
