import 'package:flutter/material.dart';
import 'package:projet_flutter_1/pages/profile.dart';
import 'package:projet_flutter_1/pages/home_page.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:projet_flutter_1/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageContacts(title: 'Flutter Demo Home Page'),
    );
  }
}

