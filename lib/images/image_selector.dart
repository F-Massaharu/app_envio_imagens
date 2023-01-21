import 'package:app_envio_imagens/blocs/images/image_bloc.dart';
import 'package:app_envio_imagens/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSelectorPage extends StatefulWidget {
  const ImageSelectorPage({super.key});

  @override
  State<ImageSelectorPage> createState() => _ImageSelectorPageState();
}

class _ImageSelectorPageState extends State<ImageSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              BlocBuilder<ImageBloc, ImageState>(
                builder: (context, state) {
                  if (state is ImagesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ImagesLoaded) {
                    var imageCount = state.imageUrls.length;
                    return Column(
                      children: [
                        Row(
                          children: [
                            (imageCount > 0)
                                ? ImageContainer(imageUrls: state.imageUrls[0])
                                : const ImageContainer(),
                            (imageCount > 1)
                                ? ImageContainer(imageUrls: state.imageUrls[1])
                                : const ImageContainer(),
                            (imageCount > 2)
                                ? ImageContainer(imageUrls: state.imageUrls[2])
                                : const ImageContainer(),
                          ],
                        ),
                        Row(
                          children: [
                            (imageCount > 3)
                                ? ImageContainer(imageUrls: state.imageUrls[3])
                                : const ImageContainer(),
                            (imageCount > 4)
                                ? ImageContainer(imageUrls: state.imageUrls[4])
                                : const ImageContainer(),
                            (imageCount > 5)
                                ? ImageContainer(imageUrls: state.imageUrls[5])
                                : const ImageContainer(),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Text('Algo deu errado');
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
