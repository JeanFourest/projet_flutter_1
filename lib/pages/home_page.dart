import 'package:flutter/material.dart';
import 'package:projet_flutter_1/pages/event.dart';
import 'package:projet_flutter_1/pages/tournament.dart';
import 'package:projet_flutter_1/pages/training.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Event {
  final String title;
  final String description;
  final String date;

  Event({
    required this.title,
    required this.description,
    required this.date,
  });
}

class _MyHomePageState extends State<MyHomePage> {
  /* int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  } */

  final flux = [
    Event(title: "title", description: "description", date: "date"),
    Event(title: "party", description: "anniversary", date: "10/10/2000")
  ];

  String pages = "Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
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
                /* print(pages); */
              },
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
        body: (ListView.builder(
            itemCount: flux.length,
            itemBuilder: (context, index) => _buildContactCard(flux[index]))));
    /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
  }
}

Widget _buildContactCard(flux) {
  /* print(flux.description); */
  return Card(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.blue, width: 1.0)),
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(flux.title, style: const TextStyle(fontSize: 25)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(flux.description, style: const TextStyle(fontSize: 20)),
            Text(flux.date),
            TextButton(child: const Text("Join"), onPressed: () {})
          ],
        ),
      ));
}
