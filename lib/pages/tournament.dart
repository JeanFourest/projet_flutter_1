import 'package:flutter/material.dart';
import 'package:projet_flutter_1/db.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({super.key, required this.title});

  final String title;

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  //la variable allTournaments est initialisée à null pour recevoir les données de la base de données
  var allTournaments;

  //la fonction tournaments() permet de récupérer les données de la base de données
  tournaments() async {
    var tournaments = await MongoDatabase.getTournament();
    return tournaments;
  }

  //la fonction initState() permet d'initialiser la variable allTournaments avec les données de la base de données
  @override
  void initState() {
    super.initState();
    tournaments().then((result) {
      setState(() {
        allTournaments = result;
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
        body: allTournaments == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: allTournaments.length,
                itemBuilder: (context, index) =>
                    _buildCard(allTournaments[index])));
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
            Text("type: ${flux['type']}", style: const TextStyle(fontSize: 20)),
            Text("address: ${flux['address']}",
                style: const TextStyle(fontSize: 20)),
            Text("When: ${flux['date']}", style: const TextStyle(fontSize: 20)),
            Text(flux['dateTimeAdded']),
            TextButton(child: const Text("Join"), onPressed: () {})
          ],
        ),
      ));
}
