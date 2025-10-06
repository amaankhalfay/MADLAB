import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstantDisplayScreen(),
    );
  }
}
class InstantDisplayScreen extends StatefulWidget {
  const InstantDisplayScreen({super.key});
  @override
  State<InstantDisplayScreen> createState() => _InstantDisplayScreenState();
}
class _InstantDisplayScreenState extends State<InstantDisplayScreen> {
  String _currentText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f6f9),
      appBar: AppBar(
        title: const Text(
          '✨ Live Text Display',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff546e7a),
        elevation: 4,
        shadowColor: Colors.black45,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField container with decoration
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  hintText: 'Type something beautiful...',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  suffixIcon: const Icon(Icons.edit, color: Colors.blueGrey),
                ),
                onChanged: (newText) {
                  setState(() {
                    _currentText = newText;
                  });
                },
              ),
            ),
            const SizedBox(height: 40),
            // Animated text display with smooth fade
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: _currentText.isEmpty
                  ? const Text(
                      '👀 Start typing above...',
                      key: ValueKey('placeholder'),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  : Container(
                      key: const ValueKey('text'),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blueGrey.shade200),
                      ),
                      child: Text(
                        _currentText,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
