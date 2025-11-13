import 'package:flutter/material.dart';

void main() {
  runApp(const ActionButtonApp());
}

class ActionButtonApp extends StatelessWidget {
  const ActionButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ActionButtonScreen(),
    );
  }
}

class ActionButtonScreen extends StatelessWidget {
  const ActionButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F6),

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Call Button
              IconButton(
                icon: const Icon(Icons.call, size: 32, color: Colors.green),
                onPressed: () {
                  print("Call Button Pressed");
                },
              ),

              // Message Button
              IconButton(
                icon: const Icon(Icons.message, size: 32, color: Colors.blue),
                onPressed: () {
                  print("Message Button Pressed");
                },
              ),

              // Email Button
              IconButton(
                icon: const Icon(Icons.email, size: 32, color: Colors.red),
                onPressed: () {
                  print("Email Button Pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
