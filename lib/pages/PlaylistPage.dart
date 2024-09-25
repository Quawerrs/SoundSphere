import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Assurez-vous d'importer FirebaseAuth si vous utilisez Firebase

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
      home: const PlaylistPage(), // Garde PlaylistPage comme page d'accueil
      debugShowCheckedModeBanner: false,
    );
  }
}

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth
        .instance.currentUser; // Assurez-vous que FirebaseAuth est initialisé

    return Scaffold(
      appBar: AppBar(
        title: const Text('SoundSphere'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        // Permettre le défilement si le contenu dépasse l'espace disponible
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bienvenue à l\'accueil de MUSIC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Vous pouvez ajouter d'autres widgets ici, par exemple, une liste de chansons, etc.
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Profil en haut du menu
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
                        Text(
                          user?.email ??
                              'Email non disponible', // Affichage de l'email utilisateur
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Votre Compte',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Autres options du menu
            ListTile(
              leading: const Icon(Icons.playlist_play, color: Colors.white),
              title: const Text('Playlists',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Action pour "Playlists"
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Paramètres',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Action pour "Paramètres"
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white),
            // Bouton de déconnexion
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Déconnexion',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                // Action pour déconnexion
                Navigator.pop(context);
                // Vous pouvez également appeler votre méthode de déconnexion ici
                print('Déconnexion');
              },
            ),
          ],
        ),
      ),
    );
  }
}
