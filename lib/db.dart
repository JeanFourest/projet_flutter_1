import 'dart:async';
import 'dart:ffi';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:projet_flutter_1/models/user.dart';

class MongoDatabase {
  static late DbCollection userCollection;
  static late DbCollection eventCollection;
  static late DbCollection tournoisCollection;
  static late DbCollection trainingCollection;
  static late DbCollection horseCollection;
  static late DbCollection partiesCollections;
  static late DbCollection trainingCollections;
  static late DbCollection tournamentCollections;
  static Future<void> connect() async {
    try {
      print('STARTING CONNECTION');
      //Connexion a la DB
      var db = await Db.create(
          'mongodb+srv://cavalier01:cavalier01@fluttercavalier.vik0exh.mongodb.net/fluttercavalier');
      await db.open();
      userCollection = db.collection('users');
      eventCollection = db.collection('parties');
      tournoisCollection = db.collection('tournament');
      trainingCollection = db.collection('training');
      horseCollection = db.collection('horses');
      partiesCollections = db.collection('parties');
      trainingCollections = db.collection('training');
      tournamentCollections = db.collection('tournament');
      print('Connexion à MongoDB réussie');
    } catch (e) {
      print('Erreur de connexion à MongoDB: $e');
    }
  }

  //-------------REQUETE-MONGODB-ALL-USERS-------------
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
        'phoneNumber': '',
        'age': 0,
        'link': '',
        'isAdmin': false,
        'isDP': false,
      });
      print('Utilisateur : $user.username a été créé avec succès');
    } catch (e) {
      print('Erreur lors de la création du compte: $e');
    }
  }

  // ------------------------------REQUETE-MONGODB-EDIT-PROFIL------------------------------\\

  // ----------REQUETE-MONGODB-EDIT-UPDATE-USER----------
  static Future<void> updateUserUsername(
      String userId, String usernameEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('username', usernameEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-PHONE----------
  static Future<void> updateUserPhone(String userId, String phoneEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('phoneNumber', phoneEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-EMAIL----------
  static Future<void> updateUserEmail(String userId, String emailEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('email', emailEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-PHOTO----------
  static Future<void> updateUserPhoto(String userId, String photoEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('photo', photoEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-PASSWORD----------
  static Future<void> updateUserPassword(
      String userId, String passwordEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('password', passwordEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-AGE----------
  static Future<void> updateUserAge(String userId, String AgeEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('age', AgeEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-FFE----------
  static Future<void> updateUserFFE(String userId, String FFEEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('ffe', FFEEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-DP----------
  static Future<void> updateUserDP(String userId, String DPEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('dp', DPEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  //-------------REQUETE-MONGODB-ALL-PARTIES-------------
  static Future<List<Map<String, dynamic>>> getParties() async {
    try {
      final parties = await partiesCollections.find().toList();
      return parties;
    } catch (e) {
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  //-------------REQUETE-MONGODB-ALL-EVENTS-COMBINED------------
  static Future<List<Map<String, dynamic>>> getAllEvents() async {
    try {
      final parties = await partiesCollections.find().toList();
      final training = await trainingCollections.find().toList();
      final tournament = await tournamentCollections.find().toList();
      final users = await userCollection.find().toList();

      final List<Map<String, dynamic>> combined = [
        ...parties,
        ...training,
        ...tournament,
        ...users
      ];

      return combined;
    } catch (e) {
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  // ----------REQUETE-MONGODB-EDIT-UPDATE-Horses----------
  static Future<void> updateUserHorses(
      String userId, List userHorsesEdited) async {
    try {
      await userCollection.update(
        where.id(ObjectId.parse(
            userId)), // Obligez d'utiliser ça parceque c des object id ('0000')
        modify.set('horses', userHorsesEdited),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

  // ------------------------------REQUETE-MONGODB-EDIT-PROFIL------------------------------\\

  // ----------REQUETE-MONGODB-CREATE-EVENT-----------
  static Future<void> createEvent(
      String title, String theme, String photo, String date) async {
    try {
      await eventCollection.insertOne({
        'type': "party",
        'title': title,
        'photo': photo,
        'theme': theme,
        'status': true,
        'date': date,
        'dateTimeAdded': "10/03/2020 - 11h32",
      });
    } catch (e) {
      print('Erreur lors de la création de l\'événement: $e');
    }
  }

  // ----------REQUETE-MONGODB-CREATE-TOURNOIS-----------
  static Future<void> createTournois(String title, String adresse, String photo,
      String date, List participant) async {
    try {
      await tournoisCollection.insertOne({
        'type': "tournament",
        'address': adresse,
        'photo': photo,
        'date': date,
        'users': participant,
        'title': title,
        'dateTimeAdded': "10/03/2020 - 11h32",
      });
    } catch (e) {
      print('Erreur lors de la création de l\'événement: $e');
    }
  }

  // ----------REQUETE-MONGODB-CREATE-TOURNOIS-----------
  static Future<void> createTraining(
      String terrain, String duration, String discipline, String date) async {
    try {
      await trainingCollection.insertOne({
        'type': "training",
        'terrain': terrain,
        'duration': duration,
        'discipline': discipline,
        'statue': "true",
        'dateTimeAdded': "23/03/2014 - 15h33",
        'date': date,
        'user': ('6501bfc8317d438a2f369e4f')
      });
    } catch (e) {
      print('Erreur lors de la création de l\'événement: $e');
    }
  }

  // REQUETE POUR AFFICHER LES TRUCS
  static Future<List<Map<String, dynamic>>> getEvents() async {
    try {
      final parties = await eventCollection.find().toList();
      return parties;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static Future<List<Map<String, dynamic>>> getTournament() async {
    try {
      final parties = await tournoisCollection.find().toList();
      return parties;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static Future<List<Map<String, dynamic>>> getTraining() async {
    try {
      final parties = await trainingCollection.find().toList();
      return parties;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static Future<void> updateTrainingValidation(
      ObjectId trainingID, String status) async {
    try {
      await trainingCollection.update(
        where.id(trainingID),
        modify.set('status', status),
      );
    } catch (e) {
      print('Erreur lors de la mise à jour du nom d\'utilisateur: $e');
    }
  }

/*
static Future<List<Map<String, dynamic>>> getAllUser() async {
      try {
        final users = await userCollection.find().toList();
        return users;
      } catch (e) {
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
          'phoneNumber': '',
          'age': 0,
          'link': '',
          'isAdmin': false,
          'isDP': false,
        });
        print('Utilisateur : $user.username a été créé avec succès');
      } catch (e) {
        print('Erreur lors de la création du compte: $e');
      }
    }

    static Future<User?> getUserByUsername(String username) async {
      try {
        final user = await userCollection.findOne(where.eq('username', username));
        if (user != null) {
          return User(
            username: user['username'],
            password: user['password'],
            email: user['email'],
            photo: user['photo'],
            phoneNumber: user['phoneNumber'],
            age: user['age'],
            link: user['link'],
            isAdmin: user['isAdmin'],
            isDP: user['isDP'],
          );
        }
        return null; // L'utilisateur n'a pas été trouvé
      } catch (e) {
        print('Erreur lors de la récupération des données de l\'utilisateur: $e');
        return null;
      }
    }

  }
  }*/
}
