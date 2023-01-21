import 'package:image_picker/image_picker.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(XFile file);
  Future<String> getImageUrl(String imageName);
}
