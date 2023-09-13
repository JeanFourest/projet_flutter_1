import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:projet_flutter_1/pages/homePage.dart';
import 'package:projet_flutter_1/db.dart';
=======
import 'package:projet_flutter_1/pages/home_page.dart';
>>>>>>> 40583d0405f722ba22bed3fd8bbb7a628fce4d8d

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
