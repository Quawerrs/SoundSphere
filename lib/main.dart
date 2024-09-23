import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundSphere',
      theme: ThemeData.dark(), // Utiliser le thème sombre
      home: const LoginPage(),
      debugShowCheckedModeBanner: false, // Enlève le bandeau de démo
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fond noir
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white, // Couleur du conteneur
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent
                    .withOpacity(0.5), // Couleur de l'effet de lumière
                blurRadius: 20.0, // Flou de l'ombre
                spreadRadius: 5.0, // Élargissement de l'ombre
              ),
            ],
          ),
          width: 300, // Largeur du conteneur
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ajoutez ici la logique pour la connexion
                },
                child: const Text('Se connecter'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Ajoutez ici la logique pour s'inscrire ou réinitialiser le mot de passe
                },
                child: const Text('Créer un compte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
