import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

const List<Student> students = [
  Student(
    name: 'Alex Camacho',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'alex.camacho@school.edu',
  ),
  Student(
    name: 'Wendy Pasadillo',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'wendy.pasadillo@school.edu',
  ),
  Student(
    name: 'Jay Aguelo',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'jay.aguelo@school.edu',
  ),
  Student(
    name: 'Jed Mendoza',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'jed.mendoza@school.edu',
  ),
  Student(
    name: 'Khen Lumindas',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'khen.lumindas@school.edu',
  ),
];

// Stateless kay wala'y data nga mausab, config ra sa app.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal, // customization #1
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

// Stateless kay ang fixed nga list ra ang gi-display.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'), // TODO 1
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'Students'), // TODO 2
          for (final s in students) StudentCard(student: s), // TODO 3
        ],
      ),
    );
  }
}

// Stateless kay ang icon ug text ra ang gi-display.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.teal),
        const SizedBox(width: 6),
        Expanded(child: Text(text)),
      ],
    );
  }
}

// Stateless kay ang title nga gi-pass ra ang gi-display.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, // TODO 4
              color: Colors.teal, // customization #2
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

// Stateless kay ang Student nga gi-pass ra ang gi-display.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // TODO 5
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade100,
              child: Text(
                student.name[0], // TODO 6
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name, // TODO 7
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(student.course),
                  const SizedBox(height: 4),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year ${student.yearLevel}',
                  ),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
