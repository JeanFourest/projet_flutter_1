import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/pages/event.dart';
import 'package:projet_flutter_1/pages/tournament.dart';
import 'package:projet_flutter_1/pages/training.dart';

class tournamentParticiped extends StatefulWidget {
  const tournamentParticiped({super.key, required this.title});

  final String title;

  @override
  State<tournamentParticiped> createState() => _tournamentParticipedState();
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

class _tournamentParticipedState extends State<tournamentParticiped> {
  var flux;

  getAll() async {
    var events = await MongoDatabase.getTournament();
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

  if (flux['type'] == "tournament") {
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
  } else {
    return const Card();
  }
}
