import 'package:app_envio_imagens/model/user_model.dart';
import 'package:app_envio_imagens/storage/base_database_repository.dart';
import 'package:app_envio_imagens/storage/image_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseRepository extends BaseDatabaseRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Stream<User> getUser() {
    return _firebaseFirestore
        .collection('users')
        .doc('oeorqCZ5oliu6EAxhmax')
        .snapshots()
        .map((snapshot) => User.fromSnapshot(snapshot));
  }

  @override
  Future<void> updateUserPictures(String imageName) async {
    String downloadUrl = await StorageRepository().getImageUrl(imageName);
    return _firebaseFirestore
        .collection('users')
        .doc('oeorqCZ5oliu6EAxhmax')
        .update({
      'imageUrls': FieldValue.arrayUnion([downloadUrl]),
    });
  }
}
