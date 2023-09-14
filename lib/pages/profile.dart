import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/profil/our_event.dart';

class ContactInfo {
  String nom = "";
  String prenom = "";
  String numero = "";
  String email = "";
}

class PageProfil extends StatefulWidget {
  const PageProfil({Key? key, required this.title});

  final String title;

  @override
  State<PageProfil> createState() => _PageProfilState();
}

Future<void> _fetchContacts() async {
 //var collection = MongoDatabase.db.collection('users');
  //var contacts = await collection.find().toList();
  //print(contacts);
}

class _PageProfilState extends State<PageProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: const actionProfil(),
    );
  }
}

class actionProfil extends StatelessWidget {
  const actionProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OurEvent(title: 'Vos Event'),
              ),
            );
          },
          child: const Card(
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Icon(Icons.celebration),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Créer un Event')
                    ],
                  ),
                  subtitle:
                      Text('Retrouvez toutes vos événements créées par vous'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 1000),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageProfil(title: 'Vos Event'),
              ),
            );
          },
          child: const Card(
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Icon(Icons.emoji_events),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Créer une Compétitions')
                    ],
                  ),
                  subtitle:
                      Text('Retrouvez toutes vos compétitions créées par vous'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageProfil(title: 'Vos Event'),
              ),
            );
          },
          child: const Card(
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.history),
                      Icon(Icons.celebration),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Vos Compétitions')
                    ],
                  ),
                  subtitle: Text(
                      'Retrouvez toutes vos compétitions auquels vous participez'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageProfil(title: 'Vos Event'),
              ),
            );
          },
          child: const Card(
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.history),
                      Icon(Icons.emoji_events),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Vos Compétitions')
                    ],
                  ),
                  subtitle: Text(
                      'Retrouvez toutes vos compétitions auquelles vous participez'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageProfil(title: 'Vos Event'),
              ),
            );
          },
          child: const Card(
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.history),
                      Icon(Icons.insights),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Vos Entrainements')
                    ],
                  ),
                  subtitle: Text(
                      'Retrouvez tous vos entrainements auquelles vous participez'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
