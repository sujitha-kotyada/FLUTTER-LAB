import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Information',
      home: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: const Text("Student Information"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              StudentCard(
                name: "Sujitha",
                branch: "CSE",
                cgpa: "9.36",
                icon: Icons.person,
              ),
              StudentCard(
                name: "Rupa",
                branch: "CSE",
                cgpa: "9.65",
                icon: Icons.person_2,
              ),
              StudentCard(
                name: "Chelisha",
                branch: "CSE",
                cgpa: "9.45",
                icon: Icons.person_3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget
class StudentCard extends StatelessWidget {
  final String name;
  final String branch;
  final String cgpa;
  final IconData icon;

  const StudentCard({
    super.key,
    required this.name,
    required this.branch,
    required this.cgpa,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Branch: $branch"),
              Text("CGPA: $cgpa"),
            ],
          ),
        ],
      ),
    );
  }
}
