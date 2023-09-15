import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/event.dart';
import 'package:projet_flutter_1/pages/tournament.dart';
import 'package:projet_flutter_1/pages/training.dart';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:projet_flutter_1/pages/profile.dart';
import 'package:projet_flutter_1/pages/register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //la variable flux est initialisée à null pour recevoir les données de la base de données
  var flux;

  //la fonction getAll() permet de récupérer les données de la base de données
  getAll() async {
    var events = await MongoDatabase.getAllEvents();
    return events;
  }

  //la fonction initState() permet d'initialiser la variable flux avec les données de la base de données
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

  //la variable pages permet de changer de page avec le dropdownbutton
  String pages = "Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            //dropdownbutton pour changer de page entre profile, event party, training et tournament
            DropdownButton<String>(
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(Icons.menu),
              onChanged: (String? newValue) {
                setState(() {
                  pages = newValue!;
                });

                if (pages == "profile") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: "Profile",
                              )));
                } else if (pages == "event party") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventPage(
                                title: "Event Parties",
                              )));
                } else if (pages == "training") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrainingPage(
                                title: "Training Events",
                              )));
                } else if (pages == "tournament") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TournamentPage(
                                title: "Tournament",
                              )));
                }
              },
              //items du dropdownbutton
              items: const [
                DropdownMenuItem<String>(
                  value: "profile",
                  child: Text("Profile"),
                ),
                DropdownMenuItem<String>(
                  value: "event party",
                  child: Text("Event Party"),
                ),
                DropdownMenuItem<String>(
                  value: "training",
                  child: Text("Training"),
                ),
                DropdownMenuItem<String>(
                  value: "tournament",
                  child: Text("Tournament"),
                ),
              ],
            )
          ],
        ),
        body: flux == null
            ? const CircularProgressIndicator()
            //ListView.builder permet de construire une liste de cartes en utilisant la function _buildCard
            : ListView.builder(
                itemCount: flux.length,
                itemBuilder: (context, index) => _buildCard(flux[index])));
  }
}

//la fonction _buildCard permet de construire une carte en fonction du type de l'évènement
Widget _buildCard(flux) {
  if (flux['type'] == "party" && flux['status'] == "true") {
    //parties
    return Card(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.blue, width: 1.0)),
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(flux['title'], style: const TextStyle(fontSize: 25)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("type: ${flux['type']}",
                  style: const TextStyle(fontSize: 20)),
              Text("theme: ${flux['theme']}",
                  style: const TextStyle(fontSize: 20)),
              Text("When: ${flux['date']}",
                  style: const TextStyle(fontSize: 20)),
              Text(flux['dateTimeAdded']),
              TextButton(child: const Text("Join"), onPressed: () {})
            ],
          ),
        ));
  } else if (flux['type'] == "tournament") {
    //tournament
    return Card(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.blue, width: 1.0)),
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(flux['title'], style: const TextStyle(fontSize: 25)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("type: ${flux['type']}",
                  style: const TextStyle(fontSize: 20)),
              Text("address: ${flux['address']}",
                  style: const TextStyle(fontSize: 20)),
              Text("When: ${flux['date']}",
                  style: const TextStyle(fontSize: 20)),
              Text(flux['dateTimeAdded']),
              /* Text(flux['dateTimeAdded']), */
              TextButton(child: const Text("Join"), onPressed: () {})
            ],
          ),
        ));
  } else if (flux['type'] == "training" && flux['status'] == "true") {
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
              Text("type: ${flux['type']}",
                  style: const TextStyle(fontSize: 20)),
              Text("terrain: ${flux['terrain']}",
                  style: const TextStyle(fontSize: 20)),
              Text("duration: ${flux['duration']}",
                  style: const TextStyle(fontSize: 20)),
              Text("When: ${flux['date']}",
                  style: const TextStyle(fontSize: 20)),
              Text(flux['dateTimeAdded'])
            ],
          ),
        ));
  } else if (flux['username'] != null) {
    //new user
    return Card(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.blue, width: 1.0)),
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
            title: Text("New user added: ${flux['username']}",
                style: const TextStyle(fontSize: 25))));
  } else {
    //default si aucun évènement n'est trouvé
    return const Card();
  }
}
