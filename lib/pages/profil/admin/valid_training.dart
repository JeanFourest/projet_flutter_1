import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/event.dart';
import 'package:projet_flutter_1/pages/tournament.dart';
import 'package:projet_flutter_1/pages/training.dart';

class validTraining extends StatefulWidget {
  const validTraining({super.key, required this.title});

  final String title;

  @override
  State<validTraining> createState() => _validTrainingState();
}

class _validTrainingState extends State<validTraining> {
  var flux;

  getAll() async {
    var trainings = await MongoDatabase.getTraining();
    return trainings;
  }

  @override
  void initState() {
    super.initState();
    // Call parties() inside initState
    getAll().then((result) {
      setState(() {
        flux = result;
      });
      print(flux.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: flux == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: flux.length,
                itemBuilder: (context, index) =>
                    _buildContactCard(flux[index])));
  }
}

Widget _buildContactCard(flux) {
  print(flux);

  if (flux['type'] == "training") {
    //parties
    return Card(
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
              Text("type: ${flux['type']}",
                  style: const TextStyle(fontSize: 20)),
              Text("terrain: ${flux['terrain']}",
                  style: const TextStyle(fontSize: 20)),
              Text("duration: ${flux['duration']}",
                  style: const TextStyle(fontSize: 20)),
              Text("When: ${flux['date']}",
                  style: const TextStyle(fontSize: 20)),
              Text(flux['dateTimeAdded']),
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      /* MongoDatabase.updateTraining(flux['_id'], "true");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const training()),
                      ); */
                    },
                    child: const Text('VALIDER'),
                  ),
                  TextButton(
                    onPressed: () {
                      /* MongoDatabase.deleteTraining(flux['_id']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const training()),
                      ); */
                    },
                    child: const Text('REFUSER'),
                  ),
                ],
              )
            ],
          ),
        ));
  } else {
    return const Card();
  }
}
