import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:veedeos_app/data/repositories/videos_repository.dart';
import 'package:veedeos_app/features/videos_gallery/view_models/videos_gallery_view_model.dart';
import 'package:veedeos_app/features/videos_gallery/views/gallery_error.dart';
import 'package:veedeos_app/features/videos_gallery/views/gallery_list.dart';
import 'package:veedeos_app/features/videos_gallery/widgets/gallery_appbar.dart';

class VideosGalleryPage extends StatelessWidget {
  const VideosGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final VideosGalleryViewModel viewModel =
        VideosGalleryViewModel(GetIt.instance.get<VideoRepository>());

    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: GalleryAppbar(viewModel: viewModel),
        body: BlocBuilder<VideosGalleryViewModel, VideosGalleryState>(
          builder: (context, state) {
            return switch (state) {
              VideosGalleryInitial() ||
              VideosGalleryLoading() =>
                const Center(child: CircularProgressIndicator()),
              VideosGalleryLoaded() => GalleryList(
                  videos: state.videos,
                  displayMode: state.displayMode,
                ),
              VideosGalleryError() => GalleryError(
                  onRetry: viewModel.fetchVideos,
                  errorMessage: state.error,
                ),
            };
          },
        ),
      ),
    );
  }
}
