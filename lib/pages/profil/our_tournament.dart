import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/profile.dart';

import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/models/user.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class OurTournament extends StatefulWidget {
  const OurTournament({Key? key, required this.title});

  final String title;

  @override
  State<OurTournament> createState() => _OurTournamentState();
}

class _OurTournamentState extends State<OurTournament> {
  XFile? image;

  final picker = ImagePicker();

  final User user = User(
      username: '',
      password: '',
      email: '',
      photo: '',
      phoneNumber: '',
      age: 0,
      link: '',
      isAdmin: false,
      isDP: false);

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      if (img != null) {
        List<int> imageBytes = File(img.path).readAsBytesSync();
        String base64Image = base64Encode(imageBytes);
        user.photo = base64Image;
        image = img;
      }
    });
  }

  // show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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
      body: const CreerTournois(),
    );
  }
}

class CreerTournois extends StatefulWidget {
  const CreerTournois({Key? key}) : super(key: key);

  @override
  _CreerTournoisState createState() => _CreerTournoisState();
}

class _CreerTournoisState extends State<CreerTournois> {
  late String _createTournoisTitle;
  late String _createTournoisAdresse;
  late String _createTournoisPhoto;
  late String _createTournoisDate;
  late List<String> _createTournoisParticipants = [];

  final _keyForm = GlobalKey<FormState>();
  XFile? image;

  final picker = ImagePicker();

  final User user = User(
      username: '',
      password: '',
      email: '',
      photo: '',
      phoneNumber: '',
      age: 0,
      link: '',
      isAdmin: false,
      isDP: false);

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      if (img != null) {
        List<int> imageBytes = File(img.path).readAsBytesSync();
        String base64Image = base64Encode(imageBytes);
        user.photo = base64Image;
        image = img;
      }
    });
  }

  // show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createTournoisTitle = value ?? '';
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
              _createTournoisAdresse = value ?? '';
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
              _createTournoisPhoto = value ?? '';
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
              _createTournoisDate = value ?? '';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText:
                    'Entrez le pseudo des participants en les séparant par une virgule'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Peut pas etre vide';
              }
              return null;
            },
            onSaved: (value) {
              if (value != null) {
                _createTournoisParticipants =
                    value.split(',').map((e) => e.trim()).toList();
              }
            },
          ElevatedButton(
            onPressed: () {
              myAlert();
            },
            child: const Text('Upload Photo'),
          ),
          const SizedBox(
            height: 10,
          ),
          //if image not null show the image
          //if image null show text
          image != null
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                //to show image, you type like this.
                File(image!.path),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            ),
          )
              : const Text(
            "No Image",
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () async {
                if (_keyForm.currentState!.validate()) {
                  _keyForm.currentState!.save();
                  final titleUpdate = _createTournoisTitle;
                  final adresseUpdate = _createTournoisAdresse;
                  final photoUpdate = _createTournoisPhoto;
                  final dateUpdate = _createTournoisDate;
                  final participantsUpdate = _createTournoisParticipants;

                  // Utilisez la méthode createTournois pour insérer un nouveau tournoi
                  await MongoDatabase.createTournois(titleUpdate, adresseUpdate,
                      photoUpdate, dateUpdate, participantsUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tournoi créé avec succès'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Tournois'),
                    ),
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
