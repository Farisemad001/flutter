import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool signUpHover = false;
  bool signInHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF402E7A),
      appBar: AppBar(
        title: const Text('Aesthetic Shop'),
        backgroundColor: const Color(0xFF4C3BCF),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Suwannaphum',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Aesthetic Shop',
                style: TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Adjust the radius as needed
                      child: Image.asset(
                        'assets/images/local_image.png',
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1649972904349-6e44c42644a7?w=300&h=200&fit=crop',
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              MouseRegion(
                onEnter: (_) => setState(() => signUpHover = true),
                onExit: (_) => setState(() => signUpHover = false),
                child: AnimatedScale(
                  scale: signUpHover ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3DC2EC),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUp()),
                    ),
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MouseRegion(
                onEnter: (_) => setState(() => signInHover = true),
                onExit: (_) => setState(() => signInHover = false),
                child: AnimatedScale(
                  scale: signInHover ? 1.1 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4B70F5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignIn()),
                    ),
                    child: const Text('Sign In'),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
