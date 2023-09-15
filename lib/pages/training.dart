import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key, required this.title});

  final String title;

  @override
  State<TrainingPage> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  //la variable allTournaments est initialisée à null pour recevoir les données de la base de données
  var allTrainings;

  //la fonction tournaments() permet de récupérer les données de la base de données
  trainings() async {
    var trainings = await MongoDatabase.getTraining();
    return trainings;
  }

  //la fonction initState() permet d'initialiser la variable allTournaments avec les données de la base de données
  @override
  void initState() {
    super.initState();
    trainings().then((result) {
      setState(() {
        allTrainings = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        //ListView.builder permet de créer une liste de cartes avec les données de la base de données
        body: allTrainings == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: allTrainings.length,
                itemBuilder: (context, index) =>
                    _buildCard(allTrainings[index])));
  }
}

//la fonction _buildCard permet de créer une carte avec les données de la base de données
Widget _buildCard(flux) {
  return Card(
      //training
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.blue, width: 1.0)),
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text("training: ${flux['discipline']}",
            style: const TextStyle(fontSize: 25)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("type: ${flux['type']}", style: const TextStyle(fontSize: 20)),
            Text("terrain: ${flux['terrain']}",
                style: const TextStyle(fontSize: 20)),
            Text("duration: ${flux['duration']}",
                style: const TextStyle(fontSize: 20)),
            Text("When: ${flux['date']}", style: const TextStyle(fontSize: 20)),
            Text(flux['dateTimeAdded'])
          ],
        ),
      ));
}
