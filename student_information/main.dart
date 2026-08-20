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
      title: "Student Information",
      home: const StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // Controllers
  final nameController = TextEditingController();
  final branchController = TextEditingController();
  final cgpaController = TextEditingController();

  String name = "";
  String branch = "";
  String cgpa = "";

  void displayDetails() {
    setState(() {
      name = nameController.text;
      branch = branchController.text;
      cgpa = cgpaController.text;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    branchController.dispose();
    cgpaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Student Information"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Enter Student Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: branchController,
              decoration: const InputDecoration(
                labelText: "Enter Branch",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: cgpaController,
              decoration: const InputDecoration(
                labelText: "Enter CGPA",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: displayDetails,
              child: const Text("Display Details"),
            ),
            const SizedBox(height: 20),
            if (name.isNotEmpty)
              StudentCard(
                name: name,
                branch: branch,
                cgpa: cgpa,
                icon: Icons.person,
              ),
          ],
        ),
      ),
    );
  }
}

// Custom StudentCard Widget
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
            size: 45,
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
