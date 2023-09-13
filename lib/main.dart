
import 'package:flutter/material.dart';
import 'package:projet_flutter_1/pages/home_page.dart';

void main() async {
  var db = Db('mongodb://localhost:27017/infoContacts');
  await db.open();
  print('Connexion établie');
  runApp(const AppContacts());
  var collection = db.collection('contacts');
  await collection.insert({
    'name': 'John',
    'surname': 'Doe',
    'phoneNumber': '1234567890',
    'email': 'john.doe@example.com'
  });
  await collection.remove(where.eq('name', 'John'));
  var contacts = await collection.find().toList();
  print(contacts);
  await db.close();
}

class AppContacts extends StatelessWidget {
  const AppContacts({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const PageContacts(title: 'Contacts'),
      debugShowCheckedModeBanner: false,

    );
  }
}

