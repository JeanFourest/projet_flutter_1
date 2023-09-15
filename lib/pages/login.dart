import 'package:flutter/material.dart';
import 'package:projet_flutter_1/pages/register.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/home_page.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _Login();
}

getUserAccess(username, password) async {
  var user = await MongoDatabase.getUser(username, password);
  return user;
}

class _Login extends State<Login> {
  var userID;

  /* void initState() {
    super.initState();
    getUserAccess(username, password).then((result) {
      setState(() {
        data = result;
      });
      print(data.length);
    });
  } */

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late var username = '';
  late var password = '';

  @override
  Widget build(BuildContext context) {
    // getAccess(username, password) async {
    //   return MongoDatabase.getUser(username, password);
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                onChanged: (value) => username = value,
                decoration:
                    const InputDecoration(labelText: "Nom d'utilisateur"),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Champ requis' : null,
                onChanged: (value) => password = value,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate())
                        /* {
                                print(await MongoDatabase.getUser(
                                    username, password))
                              } */
                        {
                          userID = MongoDatabase.getUser(username, password);
                          print(userID);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyHomePage(title: "Homepage")));
                        } else {
                          const AlertDialog(
                            actions: [
                              Text("Wrong Data"),
                            ],
                          );
                        }
                      },
                      child: const Text("Se connecter")),
                  // TextButton(onPressed: onPressed, child: const Text("Mot de passe oublié")),
                  // Row(children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Register(title: "Register")));
                      },
                      child: const Text("Créer un compte"))
                ],
              )
            ],
          )),
    );
  }
}
