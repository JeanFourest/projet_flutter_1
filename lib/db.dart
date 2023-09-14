import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:projet_flutter_1/models/user.dart';

class MongoDatabase {
  static late DbCollection userCollection;
  static late DbCollection horseCollection;

  static Future<void> connect() async {
    try {
      //Connexion a la DB
      var db = await Db.create(
          'mongodb+srv://cavalier01:cavalier01@fluttercavalier.vik0exh.mongodb.net/fluttercavalier');
      await db.open();
      userCollection = db.collection('users');
      horseCollection = db.collection('horses');
      // print(getDocuments());
      var getUser = await getAllUser();
      //print(getUser);
      // var contacts = await userCollection.find().toList();
      // print(contacts);
      print('Connexion à MongoDB réussie');
    } catch (e) {
      print('Erreur de connexion à MongoDB: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getAllUser() async {
    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print('Error message get doc: $e');
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static Future<void> createUser(User user) async {
    try {
      await userCollection.insertOne({
        'username': user.username,
        'password': user.password,
        'email': user.email,
        'photo': user.photo,
      });
    } catch (e) {
      print('Erreur lors de la création du compte: $e');
    }
  }
}