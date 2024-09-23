import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData.dark(),
      home: const PlaylistPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  final List<Map<String, String>> playlists = [
    {
      'title': 'Top Hits',
    },
    {
      'title': 'Chill Vibes',
    },
    {
      'title': 'Daily Mix',
    },
    {
      'title': 'Workout Playlist',
    },
    {'title': 'Pop Classics'},
    {
      'title': 'Indie Favorites',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Ajoutez ici la logique pour ouvrir la playlist
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(playlists[index]['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black54,
                  child: Text(
                    playlists[index]['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
