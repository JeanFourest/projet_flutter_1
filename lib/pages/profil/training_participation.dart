import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/event.dart';
import 'package:projet_flutter_1/pages/tournament.dart';
import 'package:projet_flutter_1/pages/training.dart';

class trainingParticiped extends StatefulWidget {
  const trainingParticiped({super.key, required this.title});

  final String title;

  @override
  State<trainingParticiped> createState() => _trainingParticipedState();
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

class _trainingParticipedState extends State<trainingParticiped> {
  var flux;

  getAll() async {
    var events = await MongoDatabase.getTraining();
    return events;
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

/*   final flux = [
    Event(title: "title", description: "description", date: "date"),
    Event(title: "party", description: "anniversary", date: "10/10/2000")
  ]; */

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
        body: flux == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: flux.length,
                itemBuilder: (context, index) =>
                    _buildContactCard(flux[index])));
    /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */
  }
}

Widget _buildContactCard(flux) {
  /* print(flux.description); */

  print(flux);

  if (flux['type'] == "party") {
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
              Text(flux['theme'], style: const TextStyle(fontSize: 20)),
              Text("When: ${flux['date']}",
                  style: const TextStyle(fontSize: 20)),
              Text(flux['dateTimeAdded']),
              TextButton(child: const Text("Join"), onPressed: () {})
            ],
          ),
        ));
  } else if (flux['type'] == "tournament") {
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
              Text(flux['address'], style: const TextStyle(fontSize: 20)),
              Text("When: ${flux['date']}",
                  style: const TextStyle(fontSize: 20)),
              Text(flux['dateTimeAdded']),
              TextButton(child: const Text("Join"), onPressed: () {})
            ],
          ),
        ));
  } else if (flux['type'] == "training") {
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
              Text("terrain: ${flux['terrain']}",
                  style: const TextStyle(fontSize: 20)),
              Text("duration: ${flux['duration']}",
                  style: const TextStyle(fontSize: 20)),
              Text("When: ${flux['date']}",
                  style: const TextStyle(fontSize: 20)),
              Text(flux['dateTimeAdded']),
              TextButton(child: const Text("Join"), onPressed: () {})
            ],
          ),
        ));
  } else {
    return Card(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.blue, width: 1.0)),
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
          title: const Text("title", style: TextStyle(fontSize: 25)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("description", style: TextStyle(fontSize: 20)),
              const Text("When: date", style: TextStyle(fontSize: 20)),
              const Text("date time added"),
              TextButton(child: const Text("Join"), onPressed: () {})
            ],
          ),
        ));
  }
}
