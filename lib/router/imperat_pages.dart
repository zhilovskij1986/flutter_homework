import 'package:flutter/material.dart';
import 'package:flutter_homework/lesson_11/homework_11_screen.dart';
import 'package:flutter_homework/lesson_12/homework_12_screen.dart';
import 'package:flutter_homework/lesson_13/homework_13_screen.dart';

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
                      const Homework11Screen('', ''),
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
