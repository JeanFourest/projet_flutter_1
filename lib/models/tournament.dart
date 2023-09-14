import 'dart:ffi';
import 'package:mongo_dart/mongo_dart.dart';

class Tournament {
  // A la creation d'un compte
  final ObjectId id;
  final String type;
  final String address;
  final String photo;
  final String title;
  final String date;
  final String dateTimeAdded;
  final Array users;

  const Tournament(
      {
      // Get user id
      required this.id,
      //need type for widget later
      required this.type,
      required this.address,
      required this.title,
      required this.photo,
      required this.date,
      required this.dateTimeAdded,
      required this.users

      // Modif profil
      /* this.phoneNumber = '',
        this.age = 0,
        this.link = '',
        this.isAdmin = false,
        this.isDP = false, */
      });
}
