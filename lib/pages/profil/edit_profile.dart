import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/models/user.dart';

class PageEditProfil extends StatefulWidget {
  const PageEditProfil({Key? key, required this.title});

  final String title;

  @override
  State<PageEditProfil> createState() => _PageEditProfilState();
}

class _PageEditProfilState extends State<PageEditProfil> {
  List<User> users = [];
  String username = "";
  String phone = "";
  String email = "";
  String photo = "";
  String age = "";
  String FFE = "";
  String DP = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    loadUserData(); // Permet d'appeler une fonction async puisque aussi non ça ne marche pas de charger un async directe
  }

  Future<void> loadUserData() async {
    var getUser = await MongoDatabase.getAllUser();
    var getUserInfo = getUser[0];
    var usernameStocke = getUserInfo['username'];
    var phoneStocke = getUserInfo['phoneNumber'];
    var emailStocke = getUserInfo['email'];
    var photoStocke = getUserInfo['photo'];
    var ageStocke = getUserInfo['age'];
    var FFEStocke = getUserInfo['ffe'];
    var DPStocke = getUserInfo['dp'];
    var passwordStocke = getUserInfo['password'];

    setState(() {
      username = usernameStocke; // met a jour
      phone = phoneStocke; // met a jour
      email = emailStocke; // met a jour
      photo = photoStocke; // met a jour
      age = ageStocke; // met a jour
      FFE = FFEStocke; // met a jour
      DP = DPStocke; // met a jour
      password = passwordStocke; // met a jour
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Editer votre profil | " + username),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.badge,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: actionProfil(
          username: username,
          phone: phone,
          email: email,
          photo: photo,
          age: age,
          FFE: FFE,
          DP: DP,
          password: password),
    );
  }
}

class actionProfil extends StatelessWidget {
  final String username;
  final String phone;
  final String email;
  final String photo;
  final String age;
  final String FFE;
  final String DP;
  final String password;

  const actionProfil({
    Key? key,
    required this.username,
    required this.phone,
    required this.email,
    required this.photo,
    required this.age,
    required this.FFE,
    required this.DP,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.perm_identity),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre nom d\'utilisateur')
                    ],
                  ),
                  subtitle: Text(username),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 1000),
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.phone),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre numéro de téléphone')
                    ],
                  ),
                  subtitle: Text(phone),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.mail),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre email')
                    ],
                  ),
                  subtitle: Text(email),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.portrait),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre photo de profil')
                    ],
                  ),
                  subtitle: Text(photo),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: const Card(
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.password),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre mot de passe')
                    ],
                  ),
                  subtitle: Text("************"),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.filter_9_plus),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre age')
                    ],
                  ),
                  subtitle: Text(age),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.link),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre liens FFE')
                    ],
                  ),
                  subtitle: Text(FFE),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: const Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Icon(Icons.timer),
                      SizedBox(
                          width: 8), // Pour ajouter un espace entre les icônes
                      Text('Modifier votre statut DP')
                    ],
                  ),
                  subtitle: Text(DP),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
