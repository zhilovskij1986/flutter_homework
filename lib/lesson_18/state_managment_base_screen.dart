import 'package:flutter/material.dart';
import 'package:flutter_homework/router/route_names.dart';
import 'package:go_router/go_router.dart';

class Homework18Screen extends StatelessWidget {
  const Homework18Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lesson 18'),
      backgroundColor: Colors.white24),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.goNamed(RouteNames.cubit.name),
                child: const Text('Cubit Example'),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.goNamed(RouteNames.bloc.name),
                child: const Text('Bloc Example'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
