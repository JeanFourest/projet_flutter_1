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

  const User({
    // Get user id
    required this.id,
    // A la creation d'un compte
    required this.username,
    required this.password,
    required this.email,
    required this.photo,
    // Modif profil
    this.phoneNumber = '',
    this.age = 0,
    this.link = '',
    this.isAdmin = false,
    this.isDP = false,
  });
}
