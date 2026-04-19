import 'package:flutter/material.dart';

class Homework11Screen extends StatelessWidget{
  const Homework11Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(16.0))
          ),
        ),
      ),
    );
  }
}