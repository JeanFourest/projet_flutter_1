import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';

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
      //var contacts = await userCollection.find().toList();
      //print(contacts);
      print('Connexion à MongoDB réussie');
    } catch (e) {
      print('Erreur de connexion à MongoDB: $e');
    }
  }

  static Future<List<Map<String, dynamic>>?> getAllUser() async {
    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print('Error message get doc: $e');
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static Future<Object?> getUser(String username, String password) async {
    try {
      print('je suis ici');
      var user = await userCollection.findOne(where.eq('username', username));
      print(user);
      if (user != null) {
        if (await password == user['password']) {
          print("getUser");
          getUserID(username);
          return user;
        } else {
          return 'wallou';
        }
      }
    } catch (e) {
      print('Error message get doc: $e');
      return Future.error(e);
    }
    return false;
  }

  static Future<String> getUserID(username) async {
    try {
      final user = await userCollection.findOne(where.eq('username', username));
      if (user != null) {
        var userID = user[0];
        print('OKKKKKK');
        print(userID);
        return userID;
      }
      return 'NOPE';
    } catch (e) {
      print(e);
      return Future.value(e.toString());
    }
  }
}
