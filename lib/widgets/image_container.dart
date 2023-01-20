import 'package:app_envio_imagens/storage/image_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: const Border(
              bottom: BorderSide(width: 1),
              top: BorderSide(width: 1),
              left: BorderSide(width: 1),
              right: BorderSide(width: 1)),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () async {
              ImagePicker _picker = ImagePicker();
              final XFile? _imageFile =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (_imageFile == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Selecione uma imagen"),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
              if (_imageFile != null) {
                StorageRepository().uploadImage(_imageFile);
              }
            },
          ),
        ),
      ),
    );
  }
}
