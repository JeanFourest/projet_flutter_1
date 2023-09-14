import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/profile.dart';

class OurEvent extends StatefulWidget {
  const OurEvent({Key? key, required this.title});

  final String title;

  @override
  State<OurEvent> createState() => _OurEventState();
}

class _OurEventState extends State<OurEvent> {
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
      body: CreerEvent(),
    );
  }
}

class CreerEvent extends StatefulWidget {
  const CreerEvent({Key? key}) : super(key: key);

  @override
  _CreerEventState createState() => _CreerEventState();
}

class _CreerEventState extends State<CreerEvent> {
  late String _createEventTitle;
  late String _createEventTheme;
  late String _createEventPhoto;
  late String _createEventDate;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Entrer un titre'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createEventTitle = value ?? '';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Entrer un thème (Soirée/Repas/Apéro)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createEventTheme = value ?? '';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Entrer une photo'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createEventPhoto = value ?? '';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Entrer une date'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createEventDate = value ?? '';
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final titleUpdate = _createEventTitle;
                  final themeUpdate = _createEventTheme;
                  final photoUpdate = _createEventPhoto;
                  final dateUpdate = _createEventDate;

                  // Utilisez la méthode createEvent pour insérer un nouvel événement
                  await MongoDatabase.createEvent(
                      titleUpdate, themeUpdate, photoUpdate, dateUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Événement créé avec succès'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );

                  // Vous pouvez rediriger l'utilisateur vers une autre page ou effectuer toute autre action ici
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
