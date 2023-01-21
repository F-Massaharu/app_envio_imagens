import 'package:app_envio_imagens/model/user_model.dart';

abstract class BaseDatabaseRepository {
  Stream<User> getUser();
  Future<void> updateUserPictures(String imageName);
}
