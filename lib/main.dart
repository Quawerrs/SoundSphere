import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importez firebase_core
import './pages/PlaylistPage.dart'; // Remplacez par le bon chemin

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Assurez-vous que Flutter est initialisé
  await Firebase.initializeApp(); // Initialisez Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundSphere',
      theme: ThemeData.dark(),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false, // Enlève le bandeau de démo
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin =
      true; // État pour déterminer si c'est le login ou l'inscription

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.5),
                blurRadius: 20.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Toggle pour changer entre Login et Register
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = true; // Switch to Login
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            isLogin ? FontWeight.bold : FontWeight.normal,
                        color: isLogin ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = false; // Switch to Register
                      });
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            !isLogin ? FontWeight.bold : FontWeight.normal,
                        color: !isLogin ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ],
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
              if (!isLogin) // Champ supplémentaire pour l'inscription
                const SizedBox(height: 10),
              if (!isLogin) // Champ pour confirmer le mot de passe
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Ajoutez ici la logique pour se connecter ou s'inscrire
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaylistPage()),
                  );
                },
                child: Text(isLogin ? 'Se connecter' : 'S\'inscrire'),
              ),
              if (isLogin) // Ajout de "Mot de passe oublié ?" seulement pour Login
                const SizedBox(height: 10),
              if (isLogin) // Affichage conditionnel du lien
                TextButton(
                  onPressed: () {
                    // Ajoutez ici la logique pour réinitialiser le mot de passe, si nécessaire
                  },
                  child: const Text('Mot de passe oublié ?'),
                ),
              const SizedBox(height: 20),
              // Boutons pour Google et Facebook
              Text('Ou se connecter avec :'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 216, 104, 96), // Couleur pour Google
                    ),
                    onPressed: () {
                      // Ajoutez ici la logique pour se connecter avec Google
                    },
                    child: const Text('Google'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Couleur pour Facebook
                    ),
                    onPressed: () {
                      // Ajoutez ici la logique pour se connecter avec Facebook
                    },
                    child: const Text('Facebook'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
