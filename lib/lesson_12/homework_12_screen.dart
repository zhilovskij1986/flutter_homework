import 'package:flutter/material.dart';

var backColor = 0xFFF5F5F5;

class Homework12Screen extends StatefulWidget {
  const Homework12Screen({super.key});

  @override
  State<Homework12Screen> createState() => __Homework12Screen();
}

class __Homework12Screen extends State<Homework12Screen> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backColor),
      appBar: AppBar(
        title: const Text('Оцінка візиту до магазину'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return StarIcon(
                    isFilled: index < _currentRating,
                    callback: () {
                      setState(() {
                        int newRating = index + 1;
                        if (_currentRating == newRating) {
                          _currentRating = 0;
                        } else {
                          _currentRating = newRating;
                        }
                      });
                    },
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Яку оціночку поставите відділам?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            DepartmentCard(title: 'Випічка'),
            DepartmentCard(title: 'Лавка традицій'),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(backColor),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Є що додати?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Поділіться загальними враженнями',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1565C0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Надіслати',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DepartmentCard extends StatefulWidget {
  final String title;

  const DepartmentCard({super.key, required this.title});

  @override
  State<DepartmentCard> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCard> {
  int _serviceSelection = 0;
  int _assortmentSelection = 0;

  Widget _buildRatingRow(
    String label,
    int currentSelection,
    Function(int) onUpdate,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (currentSelection == 1) {
                    onUpdate(0);
                  } else {
                    onUpdate(1);
                  }
                },
                child: Image.asset(
                  currentSelection == 1
                      ? 'assets/images/dizlikefull.png'
                      : 'assets/images/dizlikeclear.png',
                  width: 32,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  if (currentSelection == 2) {
                    onUpdate(0);
                  } else {
                    onUpdate(2);
                  }
                },
                child: Image.asset(
                  currentSelection == 2
                      ? 'assets/images/likefull.png'
                      : 'assets/images/likeclear.png',
                  width: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),

          _buildRatingRow('Обслуговування', _serviceSelection, (newVal) {
            setState(() {
              _serviceSelection = newVal;
            });
          }),

          const SizedBox(height: 8),

          _buildRatingRow('Асортимент', _assortmentSelection, (newVal) {
            setState(() {
              _assortmentSelection =
                  newVal; // Пряме присвоєння іншій змінній класу
            });
          }),

          const SizedBox(height: 16),

          TextField(
            decoration: InputDecoration(
              hintText: 'Розкажіть докладніше',
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class StarIcon extends StatelessWidget {
  final bool isFilled;
  final VoidCallback callback;

  const StarIcon({super.key, required this.isFilled, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Image.asset(
        isFilled ? 'assets/images/clearstar.png' : 'assets/images/fullstar.png',
        width: 48,
        height: 48,
      ),
    );
  }
}
