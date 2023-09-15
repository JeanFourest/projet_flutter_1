import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/models/user.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.title});

  final String title;

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController photoController = TextEditingController();

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
          title: const Text('Ajouter une image'),
        ),
        body: Center(
            child: Column(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                  decoration:
                      const InputDecoration(labelText: "Nom d'utilisateur"),
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                  decoration: const InputDecoration(labelText: 'Mot de passe'),
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
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Création d\'un compte ...')));

                      User user = User(
                        username: usernameController.text,
                        password: passwordController.text,
                        email: emailController.text,
                        photo: '',
                        phoneNumber: '',
                        age: 0,
                        link: '',
                        isAdmin: false,
                        isDP: false,
                      );

                      if (image != null) {
                        List<int> imageBytes =
                            File(image!.path).readAsBytesSync();
                        String base64Image = base64Encode(imageBytes);
                        user.photo = base64Image;
                      }
                      MongoDatabase.createUser(user);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ])));
  }
}
