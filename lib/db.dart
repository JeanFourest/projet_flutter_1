import 'package:mongo_dart/mongo_dart.dart';


class MongoDatabase {
  static Future<void> connect() async {
    try {
      //Connexion a la DB
      var db = await Db.create('mongodb+srv://cavalier01:cavalier01@fluttercavalier.vik0exh.mongodb.net/');
      await db.open();
      print('Connexion à MongoDB réussie');
    } catch (e) {
      print('Erreur de connexion à MongoDB: $e');
    }
  }


}