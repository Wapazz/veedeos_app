import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veedeos_app/features/videos_gallery/view_models/videos_gallery_view_model.dart';
import 'package:veedeos_app/features/videos_gallery/views/gallery_error.dart';
import 'package:veedeos_app/features/videos_gallery/views/gallery_list.dart';
import 'package:veedeos_app/features/videos_gallery/widgets/gallery_appbar.dart';

class VideosGalleryPage extends StatelessWidget {
  const VideosGalleryPage({super.key, required this.viewModel});

  final VideosGalleryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
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
