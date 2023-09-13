import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static Db? _db;
  static late DbCollection _userCollection;

  static Future<void> connect() async {
    try {
      _db = Db('mongodb+srv://cavalier01:cavalier01@fluttercavalier.vik0exh.mongodb.net/');
      await _db!.open();
      print('Connexion à MongoDB réussie');
    } catch (e) {
      print('Erreur de connexion à MongoDB: $e');
    }
  }
}