import 'dart:ffi';
import 'package:mongo_dart/mongo_dart.dart';

class Parties {
  // A la creation d'un compte
  final ObjectId id;
  final String type;
  final String title;
  final String photo;
  final String theme;
  final String status;
  final String date;
  final String dateTimeAdded;
  final Array users;

  const Parties(
      {required this.id,
      required this.type,
      required this.title,
      required this.photo,
      required this.theme,
      required this.status,
      required this.date,
      required this.dateTimeAdded,
      required this.users});
}
