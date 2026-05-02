import 'package:flutter/material.dart';
import 'package:flutter_homework/lesson_11/homework_11_screen.dart';
import 'package:flutter_homework/lesson_12/homework_12_screen.dart';
import 'package:flutter_homework/lesson_13/homework_13_screen.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.block),
              title: Text('lesson_11'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder<Widget>(
                  transitionDuration: const Duration(milliseconds: 800),
                  pageBuilder: (context, animmation, secondaryAnimation) =>
                      const Homework11Screen(),
                  transitionsBuilder:
                      (context, animmation, secondaryAnimation, child) =>
                          SlideTransition(
                            position: Tween<Offset>(
                              // begin: const Offset(1, 0),
                              //end: Offset.zero,
                              begin: const Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animmation),
                            child: child,
                          ),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.pages),
              title: Text('lesson_12'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder<Widget>(
                  transitionDuration: const Duration(milliseconds: 800),
                  pageBuilder: (context, animmation, secondaryAnimation) =>
                      const Homework12Screen(),
                  transitionsBuilder:
                      (context, animmation, secondaryAnimation, child) =>
                          RotationTransition(turns: animmation, child: child),
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.task),
              title: Text('lesson_13'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder<Widget>(
                  transitionDuration: const Duration(milliseconds: 800),
                  pageBuilder: (context, animmation, secondaryAnimation) =>
                      const WidgetConstrainsTrainingScreen(),
                  transitionsBuilder:
                      (context, animmation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animmation, child: child),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  FeatureCard(
//   title: 'lesson_12',
//   onTap: () => Navigator.push(
//     context,
//     MaterialPageRoute<Widget>(
//       builder: (context) => const Homework12Screen(),
//     ),
//   ),
// ),
//   FeatureCard(
//   title: 'lesson_13',
//   onTap: () => Navigator.push(
//     context,
//     MaterialPageRoute<Widget>(
//       builder: (context) => const WidgetConstrainsTrainingScreen(),
//     ),
//   ),
// ),
//     );
//   }
// }

class FeatureCard extends StatelessWidget {
  const FeatureCard({required this.title, required this.onTap, super.key});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.blue.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
