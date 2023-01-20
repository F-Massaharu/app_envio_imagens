import 'package:app_envio_imagens/widgets/image_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSelectorPage extends StatefulWidget {
  const ImageSelectorPage({super.key});

  @override
  State<ImageSelectorPage> createState() => _ImageSelectorPageState();
}

class _ImageSelectorPageState extends State<ImageSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inserir Imagem"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: const [
                    ImageContainer(),
                    ImageContainer(),
                    ImageContainer(),
                  ],
                ),
                Row(
                  children: const [
                    ImageContainer(),
                    ImageContainer(),
                    ImageContainer(),
                  ],
                ),
                Row(
                  children: const [
                    ImageContainer(),
                    ImageContainer(),
                    ImageContainer(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
