
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';


class ContactInfo {
  String nom = "";
  String prenom = "";
  String numero = "";
  String email = "";
}

class OurEvent extends StatefulWidget {
  const OurEvent({Key? key, required this.title});

  final String title;

  @override
  State<OurEvent> createState() => _OurEventState();
}

class _OurEventState extends State<OurEvent> {
  int _index = 0;
  List<ContactInfo> contacts = [];

  void _AjoutContactFormulaire(BuildContext context) {
    TextEditingController nomObservateur = TextEditingController();
    TextEditingController prenomObservateur = TextEditingController();
    TextEditingController numeroObservateur = TextEditingController();
    TextEditingController emailObservateur = TextEditingController();

    Widget annulerForm = TextButton(
      child: const Text("Annuler"),
      onPressed: () {
        Navigator.pop(context); // Ferme l'alerte
      },
    );
    Widget creerForm = TextButton(
      child: const Text("Créer"),
      onPressed: () {
        setState(() {
          // Créez une nouvelle instance de ContactInfo pour chaque carte
          ContactInfo contact = ContactInfo();
          contact.nom = nomObservateur.text;
          contact.prenom = prenomObservateur.text;
          contact.numero = numeroObservateur.text;
          contact.email = emailObservateur.text;
          contacts.add(contact);
          _index++;
        });
        Navigator.pop(context); // Ferme l'alerte
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Ajouter un Contact"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nomObservateur,
            decoration: const InputDecoration(labelText: 'Nom'),
          ),
          TextField(
            controller: prenomObservateur,
            decoration: const InputDecoration(labelText: 'Prénom'),
          ),
          TextField(
            controller: numeroObservateur,
            decoration: const InputDecoration(labelText: 'Numéro'),
          ),
          TextField(
            controller: emailObservateur,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
        ],
      ),
      actions: [
        annulerForm,
        creerForm,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
      body: const creerEvent(),
    );
  }
}

  class creerEvent extends  StatefulWidget {
    const creerEvent({super.key});

  @override
  _creerEventState createState() => _creerEventState();
}

class _creerEventState extends State<creerEvent> {
  final _keyForm = GlobalKey<FormState>();

  @override
Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration:
              const InputDecoration(hintText: 'Entrer un titre'),
            validator: (value) { // validator => regarde chaque textfield si il est valide => retourne true/false (activer par le validate())
              if (value == null || value.isEmpty) {
                return 'Ne peut pas etre vide';
              }
              return null;
            },
          ),
          TextFormField(
            decoration:
              const InputDecoration(hintText: 'Entrer un thème (Soirée/Repas/Apéro)'),
            validator: (value) { // validator => regarde chaque textfield si il est valide => retourne true/false (activer par le validate())
              if (value == null || value.isEmpty) {
                return 'Ne peut pas etre vide';
              }
              return null;
            },
          ),          TextFormField(
            decoration:
              const InputDecoration(hintText: 'Entrer un titre'),
            validator: (value) { // validator => regarde chaque textfield si il est valide => retourne true/false (activer par le validate())
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
                if (_keyForm.currentState!.validate()) { // validate fait tourner tous les validator => true/false
                  ScaffoldMessenger.of(context).showSnackBar( // ptit message en bas
                    const SnackBar(content: Text('Événement envoyé aux admins en attente de validation')),
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