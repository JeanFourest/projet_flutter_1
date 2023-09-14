import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';
import 'package:projet_flutter_1/main.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key, required this.title});

  final String title;

  @override
  State<EventPage> createState() => _EventPageState();
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

class _EventPageState extends State<EventPage> {
  var allParties;

  parties() async {
    var parties = await MongoDatabase.getParties();
    return parties;
  }

  @override
  void initState() {
    super.initState();
    // Call parties() inside initState
    parties().then((result) {
      setState(() {
        allParties = result;
      });
      /* print(allParties.length); */
    });
  }

  final flux = [
    Event(title: "title", description: "description", date: "date"),
    Event(title: "party", description: "anniversary", date: "10/10/2000")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: allParties == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: allParties.length,
                itemBuilder: (context, index) =>
                    _buildContactCard(allParties[index])));
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
        title: Text(flux['title'], style: const TextStyle(fontSize: 25)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(flux['theme'], style: const TextStyle(fontSize: 20)),
            Text("When: ${flux['date']}", style: const TextStyle(fontSize: 20)),
            Text(flux['dateTimeAdded']),
            TextButton(child: const Text("Join"), onPressed: () {})
          ],
        ),
      ));
}
