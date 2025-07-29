import 'package:flutter/material.dart';
import 'shopping_home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _hovering = false;
  String email = '', password = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Account sign-in successfully'),
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
        title: const Text('Sign In'),
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
                        backgroundColor: const Color(0xFF4B70F5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      child: const Text('Sign In'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
