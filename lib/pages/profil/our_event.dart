
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
      body: const actionProfil(),
    );
  }
}

  class actionProfil extends StatelessWidget {
    const actionProfil({super.key});

  @override
  Widget build(BuildContext context) {

return Center(
  child: GestureDetector(
      child: const Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.festival),
              title: Text('Vos Event'),
              subtitle: Text('Retrouvez tous vos événements créées par vous !'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
