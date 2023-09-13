
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';


class ContactInfo {
  String nom = "";
  String prenom = "";
  String numero = "";
  String email = "";
}

class PageContacts extends StatefulWidget {
  const PageContacts({Key? key, required this.title});

  final String title;

  @override
  State<PageContacts> createState() => _PageContactsState();
}

class _PageContactsState extends State<PageContacts> {
  int _index = 0;
  List<ContactInfo> contacts = [];

  var _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void _importerContacts(BuildContext context) {
    print("zdqesf");
  }

  void _AjoutContactFormulaire(BuildContext context) {
    TextEditingController nomObservateur = TextEditingController();
    TextEditingController prenomObservateur = TextEditingController();
    TextEditingController numeroObservateur = TextEditingController();
    TextEditingController emailObservateur = TextEditingController();

    Widget annulerForm = TextButton(
      child: Text("Annuler"),
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
            decoration: InputDecoration(labelText: 'Nom'),
          ),
          TextField(
            controller: prenomObservateur,
            decoration: InputDecoration(labelText: 'Prénom'),
          ),
          TextField(
            controller: numeroObservateur,
            decoration: InputDecoration(labelText: 'Numéro'),
          ),
          TextField(
            controller: emailObservateur,
            decoration: InputDecoration(labelText: 'Email'),
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
        actions: [
          TextButton(
            child: Text("Importer vos contacts"),
            onPressed: () {
              setState(() {
                _importerContacts(context);
              });
              //Navigator.pop(context); // Ferme l'alerte
            },
          ),
        ],
      ),
      body: _index > 0 ? ListView.builder(
        itemCount: _index,
        itemBuilder: (BuildContext context, int index) {
          ContactInfo contact = contacts[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.phone),
                  trailing: Text(
                    contact.numero,
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text('const ${contact.nom} ${contact.prenom}'),
                ),
                Text(contact.email),
              ],
            ),
          );
        },
      )
          : const Center( // ":" si conditions fausse =>
        child: const Text("Aucun contact n'a été ajouté."),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _AjoutContactFormulaire(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
