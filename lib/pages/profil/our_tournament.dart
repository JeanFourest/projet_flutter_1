import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

class OurTournament extends StatefulWidget {
  const OurTournament({Key? key, required this.title});

  final String title;

  @override
  State<OurTournament> createState() => _OurTournamentState();
}

class _OurTournamentState extends State<OurTournament> {
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
      body: const creerTournois(),
    );
  }
}

class creerTournois extends StatefulWidget {
  const creerTournois({super.key});

  @override
  _creerTournoisState createState() => _creerTournoisState();
}

class _creerTournoisState extends State<creerTournois> {
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Entrer un titre'),
            validator: (value) {
              // validator => regarde chaque textfield si il est valide => retourne true/false (activer par le validate())
              if (value == null || value.isEmpty) {
                return 'Ne peut pas etre vide';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Entrer un thème (Soirée/Repas/Apéro)'),
            validator: (value) {
              // validator => regarde chaque textfield si il est valide => retourne true/false (activer par le validate())
              if (value == null || value.isEmpty) {
                return 'Ne peut pas etre vide';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Entrer un titre'),
            validator: (value) {
              // validator => regarde chaque textfield si il est valide => retourne true/false (activer par le validate())
              if (value == null || value.isEmpty) {
                return 'Ne peut pas etre vide';
              }
              return null;
            },
          ),
          TextFormField(
            decoration:
                const InputDecoration(hintText: 'Entrer un truc pour la photo'),
            validator: (value) {
              // validator => regarde chaque textfield si il est valide => retourne true/false (activer par le validate())
              if (value == null || value.isEmpty) {
                return 'Ne peut pas etre vide';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_keyForm.currentState!.validate()) {
                  // validate fait tourner tous les validator => true/false
                  ScaffoldMessenger.of(context).showSnackBar(
                    // ptit message en bas
                    const SnackBar(
                        content: Text(
                            'Événement envoyé aux admins en attente de validation')),
                  );
                }
              },
              child: const Text('Créer'),
            ),
          ),
        ],
      ),
    );
  }
}
