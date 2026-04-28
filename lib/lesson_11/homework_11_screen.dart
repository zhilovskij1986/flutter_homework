import 'package:flutter/material.dart';

class Homework11Screen extends StatefulWidget {
  const Homework11Screen({super.key});

  @override
  State<Homework11Screen> createState() => _Homework11ScreenState();
}

class _Homework11ScreenState extends State<Homework11Screen> {
  
  bool _isSel1 = false;
  bool _isSel2 = false;
  bool _isSel3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Розмітка єкрана'
        ),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isSel1 = !_isSel1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 300,
                  //margin: const EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                    color: _isSel1 ? Colors.blue[900] : Colors.blue,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: _isSel1 ? [const BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))] : [],
                  ),
                 alignment: Alignment.topLeft, 
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(_isSel1 ? Icons.star : Icons.star_border, color: Colors.amber, size: 24),
                        const SizedBox(width: 10),
                        const Text(
                          'Привіт, Flutter!',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        Icon(_isSel1 ? Icons.star : Icons.star_border, color: Colors.amber, size: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
         
            const SizedBox(height: 8),
         
            GestureDetector(
              onTap: () => setState(() => _isSel2 = !_isSel2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: _isSel2 ? Colors.green[900] : Colors.green,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: _isSel2 ? [const BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))] : [],
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(_isSel2 ? Icons.star : Icons.star_border, color: Colors.amber, size: 24),
                      const SizedBox(width: 10),
                      const Text(
                        'Привіт, Flutter!',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      Icon(_isSel2 ? Icons.star : Icons.star_border, color: Colors.amber, size: 24),
                    ],
                  ),
                ),
              ),
            ),
         
            const SizedBox(height: 8),
         
            GestureDetector(
              onTap: () => setState(() => _isSel3 = !_isSel3),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: _isSel3 ? Colors.red[900] : Colors.red,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: _isSel3 ? [const BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))] : [],
                ),
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(_isSel3 ? Icons.star : Icons.star_border, color: Colors.amber, size: 24),
                      const SizedBox(width: 10),
                      const Text(
                        'Привіт, Flutter!',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      Icon(_isSel3 ? Icons.star : Icons.star_border, color: Colors.amber, size: 24),
                    ],
                  ),
                ),
              ),
            ), 
            const SizedBox(height: 193),          
          ],
                 ),
      ),
    );
  }
}