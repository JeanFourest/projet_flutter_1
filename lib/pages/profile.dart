import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/models/user.dart';
import 'package:projet_flutter_1/pages/profil/our_event.dart';
import 'package:projet_flutter_1/pages/profil/our_tournament.dart';
import 'package:projet_flutter_1/pages/profil/edit_profile.dart';
import 'package:projet_flutter_1/pages/profil/our_training.dart';
import 'package:projet_flutter_1/pages/profil/event_participation.dart';
import 'package:projet_flutter_1/pages/profil/training_participation.dart';
import 'package:projet_flutter_1/pages/profil/tournament_participation.dart';

class PageProfil extends StatefulWidget {
  const PageProfil({Key? key, required this.title});

  final String title;

  @override
  State<PageProfil> createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  List<User> users = [];
  String username = "";

  @override
  void initState() {
    super.initState();
    loadUserData(); // Permet d'appeler une fonction async puisque aussi non ça ne marche pas de charger un async directe
  }

  Future<void> loadUserData() async {
    var getUser = await MongoDatabase.getAllUser();
    var getUsername = getUser[0]; // Accédez au deuxième utilisateur
    var usernameStocke = getUsername['username'];
    setState(() {
      username = usernameStocke; // Mettez à jour la variable username ici
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(username),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.manage_accounts,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageEditProfil(title: ''),
                ),
              );
            },
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
                builder: (context) =>
                    const OurTournament(title: 'Vos Entrainements'),
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
                builder: (context) => const OurTraining(title: 'Vos Event'),
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
                      Icon(Icons.school),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Créer un Entrainement')
                    ],
                  ),
                  subtitle:
                      Text('Retrouvez tous vos entrainement créées par vous'),
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
                builder: (context) => const eventParticiped(title: 'Vos Event'),
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
                builder: (context) =>
                    const tournamentParticiped(title: 'Vos Event'),
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
                builder: (context) =>
                    const trainingParticiped(title: 'Vos Event'),
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