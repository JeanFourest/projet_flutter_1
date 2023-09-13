
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';


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

class _PageProfilState extends State<PageProfil> {
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

    return ListView(
          children: [
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
                          Icon(Icons.celebration),
                          SizedBox(width: 8), // Pour ajouter un espace entre les icônes
                          Text('Créer un Event')
                        ],
                      ),
                      subtitle: Text('Retrouvez toutes vos événements créées par vous'),
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
                          SizedBox(width: 8), // Pour ajouter un espace entre les icônes
                          Text('Créer une Compétitions')
                        ],
                      ),
                      subtitle: Text('Retrouvez toutes vos compétitions créées par vous'),
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
                          SizedBox(width: 8), // Pour ajouter un espace entre les icônes
                          Text('Vos Compétitions')
                        ],
                      ),
                      subtitle: Text('Retrouvez toutes vos compétitions auquels vous participez'),
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
                          SizedBox(width: 8), // Pour ajouter un espace entre les icônes
                          Text('Vos Compétitions')
                        ],
                      ),
                      subtitle: Text('Retrouvez toutes vos compétitions auquelles vous participez'),
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
                          SizedBox(width: 8), // Pour ajouter un espace entre les icônes
                          Text('Vos Entrainements')
                        ],
                      ),
                      subtitle: Text('Retrouvez tous vos entrainements auquelles vous participez'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      
  }
}
