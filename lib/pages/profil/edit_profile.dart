import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/models/user.dart';
import 'package:projet_flutter_1/pages/profile.dart';

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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormUsername(
                  initialText: username, // pseudo de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                  },
                );
              },
            );
          },
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormPhone(
                  initialText: phone, // number de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormEmail(
                  initialText: email, // pseudo de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                  },
                );
              },
            );
          },
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormPhoto(
                  initialText: photo, // number de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormPassword(
                  initialText: password, // number de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormAge(
                  initialText: age, // number de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormFFE(
                  initialText: FFE, // number de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
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
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return alertDialogFormDP(
                  initialText: DP, // number de base
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ptit message en bas
                      SnackBar(content: Text("modifié par => $value")),
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
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

// ALERTE DIALOG FORM --------------------------------

class alertDialogFormUsername extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormUsername({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormUsernameState createState() =>
      _alertDialogFormUsernameState();
}

class _alertDialogFormUsernameState extends State<alertDialogFormUsername> {
  late String _usernameEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouveau pseudo'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _usernameEdit, //precharge lancien pseudo
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer du texte';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _usernameEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final usernameUpdate = _usernameEdit;

                  //
                  await MongoDatabase.updateUserUsername(
                      ('6501bfc8317d438a2f369e4f'), usernameUpdate);

                  // Affiche le ptit message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "$_usernameEdit <= modifié par => $usernameUpdate"),
                    ),
                  );

                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}

// ALERTE DIALOG FORM --------------------------------

class alertDialogFormPhone extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormPhone({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormPhoneState createState() => _alertDialogFormPhoneState();
}

class _alertDialogFormPhoneState extends State<alertDialogFormPhone> {
  late String _phoneEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _phoneEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouveau numero de telephone'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _phoneEdit, //precharge lancien numberrr
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un numero';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _phoneEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final phoneUpdate = _phoneEdit;

                  // Utilisez la méthode updateUserUsername pour mettre à jour le nom d'utilisateur
                  await MongoDatabase.updateUserPhone(
                      ('6501bfc8317d438a2f369e4f'), phoneUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('numero de telephone mis à jour avec succès'),
                    ),
                  );
                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}

// ALERTE DIALOG FORM --------------------------------

class alertDialogFormEmail extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormEmail({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormEmailState createState() => _alertDialogFormEmailState();
}

class _alertDialogFormEmailState extends State<alertDialogFormEmail> {
  late String _emailEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouvelle adresse mail'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _emailEdit, //precharge lancien numberrr
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mail';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _emailEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final emailUpdate = _emailEdit;

                  // Utilisez la méthode updateUserUsername pour mettre à jour le nom d'utilisateur
                  await MongoDatabase.updateUserEmail(
                      ('6501bfc8317d438a2f369e4f'), emailUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('email mise à jour avec succès'),
                    ),
                  );
                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
// ALERTE DIALOG FORM --------------------------------

class alertDialogFormPhoto extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormPhoto({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormPhotoState createState() => _alertDialogFormPhotoState();
}

class _alertDialogFormPhotoState extends State<alertDialogFormPhoto> {
  late String _photoEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _photoEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouvelle photo'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _photoEdit, //precharge lancien numberrr
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer une photo';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _photoEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final photoUpdate = _photoEdit;

                  // Utilisez la méthode updateUserUsername pour mettre à jour le nom d'utilisateur
                  await MongoDatabase.updateUserPhoto(
                      ('6501bfc8317d438a2f369e4f'), photoUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('photo mise à jour avec succès'),
                    ),
                  );
                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
// ALERTE DIALOG FORM --------------------------------

class alertDialogFormPassword extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormPassword({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormPasswordState createState() =>
      _alertDialogFormPasswordState();
}

class _alertDialogFormPasswordState extends State<alertDialogFormPassword> {
  late String _passwordEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouveau mdp '),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _passwordEdit, //precharge lancien numberrr
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mdp';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _passwordEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final passwordUpdate = _passwordEdit;

                  // Utilisez la méthode updateUserUsername pour mettre à jour le nom d'utilisateur
                  await MongoDatabase.updateUserPassword(
                      ('6501bfc8317d438a2f369e4f'), passwordUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('mot de passe mis à jour avec succès'),
                    ),
                  );
                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
// ALERTE DIALOG FORM --------------------------------

class alertDialogFormAge extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormAge({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormAgeState createState() => _alertDialogFormAgeState();
}

class _alertDialogFormAgeState extends State<alertDialogFormAge> {
  late String _ageEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ageEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouvelle adresse mail'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _ageEdit, //precharge lancien numberrr
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un age';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _ageEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final ageUpdate = _ageEdit;

                  // Utilisez la méthode updateUserUsername pour mettre à jour le nom d'utilisateur
                  await MongoDatabase.updateUserAge(
                      ('6501bfc8317d438a2f369e4f'), ageUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('age miss à jour avec succès'),
                    ),
                  );
                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
// ALERTE DIALOG FORM --------------------------------

class alertDialogFormFFE extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormFFE({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormFFEState createState() => _alertDialogFormFFEState();
}

class _alertDialogFormFFEState extends State<alertDialogFormFFE> {
  late String _FFEEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _FFEEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouveau liens FFE'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _FFEEdit, //precharge lancien numberrr
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un liens';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _FFEEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final FFEUpdate = _FFEEdit;

                  // Utilisez la méthode updateUserUsername pour mettre à jour le nom d'utilisateur
                  await MongoDatabase.updateUserFFE(
                      ('6501bfc8317d438a2f369e4f'), FFEUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('FFE mise à jour avec succès'),
                    ),
                  );
                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
// ALERTE DIALOG FORM --------------------------------

class alertDialogFormDP extends StatefulWidget {
  final String initialText;
  final Function(String)? onSubmitted;

  const alertDialogFormDP({
    Key? key,
    required this.initialText,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _alertDialogFormDPState createState() => _alertDialogFormDPState();
}

class _alertDialogFormDPState extends State<alertDialogFormDP> {
  late String _DPEdit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _DPEdit = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Entrez votre nouveau statut DP'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _DPEdit, //precharge lancien numberrr
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un DP';
                }
                return null;
              },
              onSaved: (value) {
                // enregistre le nouveau pseudo
                _DPEdit = value ?? '';
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final DPUpdate = _DPEdit;

                  // Utilisez la méthode updateUserUsername pour mettre à jour le nom d'utilisateur
                  await MongoDatabase.updateUserDP(
                      ('6501bfc8317d438a2f369e4f'), DPUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('FFE mise à jour avec succès'),
                    ),
                  );
                  // ptite redirection pour actualiser le pseudo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PageProfil(title: 'Vos Event'),
                    ),
                  );
                }
              },
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
