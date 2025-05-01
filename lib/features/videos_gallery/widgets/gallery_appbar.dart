import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veedeos_app/features/videos_gallery/view_models/videos_gallery_view_model.dart';

class GalleryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GalleryAppbar({super.key, required this.viewModel});
  final VideosGalleryViewModel viewModel;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Veedeos'),
      actions: [
        BlocBuilder<VideosGalleryViewModel, VideosGalleryState>(
          builder: (context, state) {
            return Switch(
              value: state.displayGrid,
              onChanged: (value) {
                viewModel.switchDisplayMode(value);
              },
            );
          },
        ),
      ],
    );
  }
}
