import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ProfilePage.dart'; // Importez la page de profil

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundSphere',
      theme: ThemeData.dark(),
      home: const PlaylistPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser; // Récupérer l'utilisateur connecté

    return Scaffold(
      appBar: AppBar(
        title: const Text('SoundSphere'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Bienvenue à l\'accueil de MUSIC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150', // Remplacez par l'URL de l'image
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: Column(
                      children: [
                        // Limiter l'affichage de l'email avec ellipsis pour les emails longs
                        Text(
                          user?.email ?? 'Email non disponible', // Affichage de l'email utilisateur
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis, // Tronquer si trop long
                          maxLines: 1, // Limiter à une seule ligne
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfilePage()), // Naviguer vers la page profil
                            );
                          },
                          child: const Text(
                            'Voir votre Compte',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.playlist_play, color: Colors.white),
              title: const Text('Playlists', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Paramètres', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Déconnexion', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                print('Déconnexion');
              },
            ),
          ],
        ),
      ),
    );
  }
}
//test