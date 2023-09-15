import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/profile.dart';
import 'package:projet_flutter_1/models/user.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
  late String _createEventDate;

  final _formKey = GlobalKey<FormState>();

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
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final titleUpdate = _createEventTitle;
                  final themeUpdate = _createEventTheme;
                  final dateUpdate = _createEventDate;

                  // Utilisez la méthode createEvent pour insérer un nouvel événement
                  await MongoDatabase.createEvent(
                      titleUpdate, themeUpdate, dateUpdate);

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
