import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static late Db db;

  static Future<void> connect() async {
    try {
      db = Db('mongodb+srv://cavalier01:cavalier01@fluttercavalier.vik0exh.mongodb.net/');
      await db.open();
      print('Connexion à MongoDB réussie');
    } catch (e) {
      print('Erreur de connexion à MongoDB: $e');
    }
  }
}
