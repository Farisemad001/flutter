import 'package:flutter/material.dart';
import 'shopping_home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String name = '', email = '', password = '', confirm = '';
  bool _hovering = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Account created successfully'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ShoppingHome()),
                );
              },
              child: const Text('Close'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C3BCF),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Suwannaphum',
          fontSize: 54,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF4C3BCF),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width:
              MediaQuery.of(context).size.width > 600 ? 500 : double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  onChanged: (val) => name = val,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Enter your name';
                    if (v[0] != v[0].toUpperCase()) {
                      return 'First letter must be uppercase';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (val) => email = val,
                  validator: (v) => v != null && v.contains('@')
                      ? null
                      : 'Enter a valid email',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  onChanged: (val) => password = val,
                  validator: (v) =>
                      v != null && v.length >= 6 ? null : 'Min 6 characters',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                  onChanged: (val) => confirm = val,
                  validator: (v) =>
                      v == password ? null : 'Passwords must match',
                ),
                const SizedBox(height: 30),
                MouseRegion(
                  onEnter: (_) => setState(() => _hovering = true),
                  onExit: (_) => setState(() => _hovering = false),
                  child: AnimatedScale(
                    scale: _hovering ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 250),
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3DC2EC),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
