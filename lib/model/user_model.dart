import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final List<dynamic> imageUrls;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrls,
  });

  @override
  List<Object?> get props => [id, name, email, imageUrls];

  static User fromSnapshot(DocumentSnapshot snapshot) {
    User user = User(
        id: snapshot['id'],
        name: snapshot['name'],
        email: snapshot['email'],
        imageUrls: snapshot['imageUrls']);

    return user;
  }
}
