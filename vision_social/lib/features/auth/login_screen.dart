import 'package:flutter/material.dart';
import 'package:vision_social/shared/widgets/glass_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2E0249), Colors.black, Color(0xFF0F044C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: GlassContainer(
              width: 350,
              height: 400,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Vision Social', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  const TextField(decoration: InputDecoration(hintText: 'Email')),
                  const SizedBox(height: 16),
                  const TextField(decoration: InputDecoration(hintText: 'Password')),
                  const SizedBox(height: 32),
                  GlassContainer(
                    height: 50,
                    color: Colors.white,
                    opacity: 0.2,
                    borderRadius: 25,
                    child: const Center(child: Text('Log In', style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
