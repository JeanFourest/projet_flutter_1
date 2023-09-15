import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/profile.dart';

class OurTraining extends StatefulWidget {
  const OurTraining({Key? key, required this.title});

  final String title;

  @override
  State<OurTraining> createState() => _OurTrainingState();
}

class _OurTrainingState extends State<OurTraining> {
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
      body: CreerEntrainement(),
    );
  }
}

class CreerEntrainement extends StatefulWidget {
  const CreerEntrainement({Key? key}) : super(key: key);

  @override
  _CreerEntrainementState createState() => _CreerEntrainementState();
}

class _CreerEntrainementState extends State<CreerEntrainement> {
  late String _createTrainingTerrain;
  late String _createTrainingDuration;
  late String _createTrainingDiscipline;
  late String _createTrainingDate;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Entrer un terrain (Carrière/Manège)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createTrainingTerrain = value ?? '';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Entrer la durée (30 min | 60 min)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createTrainingDuration = value ?? '';
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                hintText:
                    'Entrer une discipline (Dressage / Saut d’obstacle / Endurance)'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createTrainingDiscipline = value ?? '';
            },
          ),
          TextFormField(
            decoration:
                const InputDecoration(hintText: 'Entrer une date et heure'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ne peut pas être vide';
              }
              return null;
            },
            onSaved: (value) {
              _createTrainingDate = value ?? '';
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final terrainUpdate = _createTrainingTerrain;
                  final durationUpdate = _createTrainingDuration;
                  final disciplineUpdate = _createTrainingDiscipline;
                  final dateUpdate = _createTrainingDate;

                  // Utilisez la méthode createEvent pour insérer un nouvel événement
                  await MongoDatabase.createTraining(terrainUpdate,
                      durationUpdate, disciplineUpdate, dateUpdate);

                  // Affichez un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Entrainement créé avec succès au ' + dateUpdate),
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
