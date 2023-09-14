import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key, required this.title});

  final String title;

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  //la variable allParties est initialisée à null pour recevoir les données de la base de données
  var allParties;

  //la fonction parties() permet de récupérer les données de la base de données
  parties() async {
    var parties = await MongoDatabase.getParties();
    return parties;
  }

  //la fonction initState() permet d'initialiser la variable allParties avec les données de la base de données
  @override
  void initState() {
    super.initState();
    parties().then((result) {
      setState(() {
        allParties = result;
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
        body: allParties == null
            ? const CircularProgressIndicator()
            //ListView.builder permet de créer une liste de cartes avec les données de la base de données
            : ListView.builder(
                itemCount: allParties.length,
                itemBuilder: (context, index) =>
                    _buildCard(allParties[index])));
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
