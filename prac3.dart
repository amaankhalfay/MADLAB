import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllTasksScreen(),
    );
  }
}
class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff4f6f9),
        appBar: AppBar(
          title: const Text(
            "✨ Combined Widgets",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade700,
          elevation: 3,
          shadowColor: Colors.black45,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              ProfileCard(),
              SizedBox(height: 30),
              RatingWidget(),
              SizedBox(height: 30),
              ContentToggle(),
            ],
          ),
        ),
      ),
    );
  }
}
// --- Sub-Task 1: Social Media Profile Card ---
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.blueGrey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 53,
              backgroundColor: Colors.grey.shade300,
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Divyam Navin",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "Flutter Developer • Tech Enthusiast",
              style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn("Posts", "120"),
                _buildStatColumn("Followers", "1.2M"),
                _buildStatColumn("Following", "350"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Column _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

// --- Sub-Task 2: Interactive Icon-Based Rating Widget ---
class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});
  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}
class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.amber.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            const Text(
              "⭐ Rate this App",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  iconSize: 32,
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 6),
            Text(
              "Your Rating: $_rating",
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
// --- Sub-Task 3: Dynamic Content Toggle with RichText ---
class ContentToggle extends StatefulWidget {
  const ContentToggle({super.key});
  @override
  State<ContentToggle> createState() => _ContentToggleState();
}
class _ContentToggleState extends State<ContentToggle> {
  bool _showFullText = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.blueGrey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
                children: [
                  const TextSpan(
                    text:
                        "Flutter is an open-source UI toolkit created by Google. It allows developers to build cross-platform apps from a single codebase, for Android, iOS, and the web",
                  ),
                  if (_showFullText)
                    const TextSpan(
                      text:
                          ", along with support for desktop platforms like Windows, macOS, and Linux. Its widget-based architecture enables fast development, expressive UIs, and native performance.",
                      style: TextStyle(color: Colors.black54),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueGrey.shade700,
                ),
                onPressed: () {
                  setState(() {
                    _showFullText = !_showFullText;
                  });
                },
                child: Text(
                  _showFullText ? "Read Less ▲" : "Read More ▼",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
