import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:projet_flutter_1/models/user.dart';
import 'package:projet_flutter_1/models/parties.dart';

class MongoDatabase {
  static late DbCollection userCollection;
  static late DbCollection horseCollection;
  static late DbCollection partiesCollections;
  static late DbCollection trainingCollections;
  static late DbCollection tournamentCollections;

  static Future<void> connect() async {
    try {
      //Connexion a la DB
      var db = await Db.create(
          'mongodb+srv://cavalier01:cavalier01@fluttercavalier.vik0exh.mongodb.net/fluttercavalier');
      await db.open();
      userCollection = db.collection('users');
      horseCollection = db.collection('horses');
      partiesCollections = db.collection('parties');
      trainingCollections = db.collection('training');
      tournamentCollections = db.collection('tournament');
      /*  var contacts = await userCollection.find().toList();
      print(contacts); */
      print('Connexion à MongoDB réussie');
    } catch (e) {
      print('Erreur de connexion à MongoDB: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getParties() async {
    try {
      final parties = await partiesCollections.find().toList();
      return parties;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static Future<List<Map<String, dynamic>>> getAllEvents() async {
    try {
      final parties = await partiesCollections.find().toList();
      final training = await trainingCollections.find().toList();
      final tournament = await tournamentCollections.find().toList();

      final List<Map<String, dynamic>> combined = [
        ...parties,
        ...training,
        ...tournament
      ];

      return combined;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }
}
