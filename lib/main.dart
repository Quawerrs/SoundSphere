import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importez firebase_core
import 'package:firebase_auth/firebase_auth.dart'; // Importez firebase_auth
import './pages/PlaylistPage.dart'; // Remplacez par le chemin correct vers PlaylistPage

// Remplacez par votre configuration Firebase
const firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyDDt6Y6coCexAJOnVgrlPz_tpC8uqi_pIc", // Clé API
  appId: "1:661358917252:android:49a297801ccd930d5934d1", // ID de l'application
  messagingSenderId: "661358917252", // ID de l'expéditeur
  projectId: "music-k1zust", // ID du projet
  authDomain: "music-k1zust.firebaseapp.com", // Domaine d'authentification
  storageBucket: "music-k1zust.appspot.com", // Bucket de stockage
);

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Assurez-vous que Flutter est initialisé

  // Vérifiez si Firebase a déjà été initialisé
  try {
    await Firebase.initializeApp(
        options: firebaseOptions); // Initialisez Firebase avec les options
  } catch (e) {
    print("Firebase already initialized: $e"); // Gérer l'erreur
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundSphere',
      theme: ThemeData.dark(),
      home: const LoginPage(), // Page d'accueil
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
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const PlaylistPage()), // Redirection vers PlaylistPage
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur de connexion : $e")),
      );
    }
  }

  Future<void> _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Les mots de passe ne correspondent pas")),
      );
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const PlaylistPage()), // Redirection vers PlaylistPage
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur d'inscription : $e")),
      );
    }
  }

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
              // Toggle entre Login et Register
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = true;
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
                        isLogin = false;
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
                controller: _emailController,
                style: const TextStyle(color: Colors.black), // Couleur du texte
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                      color: Colors.black), // Couleur de l'étiquette
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.black), // Couleur du texte
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      color: Colors.black), // Couleur de l'étiquette
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              if (!isLogin) const SizedBox(height: 10),
              if (!isLogin)
                TextField(
                  controller: _confirmPasswordController,
                  style:
                      const TextStyle(color: Colors.black), // Couleur du texte
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(
                        color: Colors.black), // Couleur de l'étiquette
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (isLogin) {
                    _login();
                  } else {
                    _register();
                  }
                },
                child: Text(isLogin ? 'Se connecter' : 'S\'inscrire'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
