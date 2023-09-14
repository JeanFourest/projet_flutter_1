import 'package:flutter/material.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key, required this.title});

  final String title;

  @override
  State<TournamentPage> createState() => _TournamentPageState();
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

class _TournamentPageState extends State<TournamentPage> {
  //des données predefinies pour tester l'affichage
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
        //ListView.builder permet de créer une liste de cartes avec les données de la base de données
        body: (ListView.builder(
            itemCount: flux.length,
            itemBuilder: (context, index) => _buildCard(flux[index]))));
  }
}

//la fonction _buildCard permet de créer une carte avec les données de la base de données
Widget _buildCard(flux) {
  return Card(
      shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.blue, width: 1.0)),
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
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
