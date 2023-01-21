import 'dart:io';
import 'package:app_envio_imagens/storage/base_image_repository.dart';
import 'package:app_envio_imagens/storage/database_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageRepository extends BaseStorageRepository {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<void> uploadImage(XFile file) async {
    try {
      await storage
          .ref('imagens_01/${file.name}')
          .putFile(
            File(file.path),
          )
          .then((p0) => DatabaseRepository().updateUserPictures(file.name));
    } catch (_) {}
  }

  @override
  Future<String> getImageUrl(String imageName) async {
    String downloadUrl =
        await storage.ref('imagens_01/$imageName').getDownloadURL();

    return downloadUrl;
  }
}
