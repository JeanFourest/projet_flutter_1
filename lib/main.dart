import 'package:flutter/material.dart';
import 'package:projet_flutter_1/pages/profile.dart';
import 'package:projet_flutter_1/pages/home_page.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/register.dart';
import 'package:projet_flutter_1/pages/profile.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const PageContacts(title: 'Home Page'),
        // '/login': (context) => Login(),
        // '/register': (context) => const Register(title: 'Register Page'),
        // '/profile': (context) => PageProfil(username: 'floedit'),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: Register(title: 'Register Page'),
      // home: ProfilePage(username: 'uvyvys'),
      // home: PageProfil(title: 'Profile Page'),
    );
  }
}
