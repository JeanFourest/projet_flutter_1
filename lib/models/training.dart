import 'package:mongo_dart/mongo_dart.dart';

class Training {
  // A la creation d'un compte
  final ObjectId id;
  final String type;
  final String terrain;
  final String duration;
  final String discipline;
  final String date;
  final String status;
  final String dateTimeAdded;
  final ObjectId user;

  const Training(
      {required this.id,
      required this.type,
      required this.terrain,
      required this.duration,
      required this.discipline,
      required this.date,
      required this.status,
      required this.dateTimeAdded,
      required this.user});
}
