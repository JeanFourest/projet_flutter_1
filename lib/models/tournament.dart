import 'dart:ffi';
import 'package:mongo_dart/mongo_dart.dart';

class Tournament {
  final ObjectId id;
  final String type;
  final String address;
  final String photo;
  final String title;
  final String date;
  final String dateTimeAdded;
  final Array users;

  const Tournament(
      {required this.id,
      required this.type,
      required this.address,
      required this.title,
      required this.photo,
      required this.date,
      required this.dateTimeAdded,
      required this.users});
}
