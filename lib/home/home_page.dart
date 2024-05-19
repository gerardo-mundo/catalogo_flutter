import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<QuerySnapshot<Map<String, dynamic>>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = FirebaseFirestore.instance.collection('peliculas').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Lista de Películas'),
      ),
      body: FutureBuilder(
        future: _movies,
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<DocumentSnapshot<Map<String, dynamic>>> movies = snapshot.data!.docs;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final title = movies[index]['title'];
                final description = movies[index]['description'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(title),
                      subtitle: Text(description),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implementar navegación a la pantalla de detalles de la película
                      },
                      child: const Text('Ver detalles'),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

