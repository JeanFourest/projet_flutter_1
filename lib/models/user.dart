import 'package:mongo_dart/mongo_dart.dart';

class User {
  // A la creation d'un compte
  final ObjectId id;
  final String username;
  final String password;
  final String email;
  final String photo;
  // Modif profil
  final String phoneNumber;
  final int age;
  final String link;
  final bool isAdmin;
  final bool isDP;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.photo, // This property is not final now
    this.phoneNumber = '',
    this.age = 0,
    this.link = '',
    this.isAdmin = false,
    this.isDP = false,
  });
}
