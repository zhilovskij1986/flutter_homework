import 'package:flutter/material.dart';
import 'cheque_entity.dart';
import 'cheque_repository.dart';

class ChequeScreen extends StatefulWidget {
  const ChequeScreen({super.key});

  @override
  State<ChequeScreen> createState() => _ChequeScreenState();
}

class _ChequeScreenState extends State<ChequeScreen> {
final ChequeRepository _repository = ChequeRepository();
late Future<ChequeEntity> _chequeFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _chequeFuture = _repository.getChequeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ваш чек')),
      body: FutureBuilder<ChequeEntity>(
        future: _chequeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Упс! Щось пішло не так',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('${snapshot.error}', textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _loadData,
                      child: const Text('Спробувати знову'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            final realCheque = snapshot.data!;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Чек №${realCheque.chequeId}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Сума: ${realCheque.totalAmount} грн',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 32),

                  const Text(
                    'Товари:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  for (var item in realCheque.items) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• $item',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                  const Divider(height: 32),

                  const Text(
                    'Передбачення:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    realCheque.prediction,
                    style: const TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(child: Text('Немає даних'));
        },
      ),
    );
  }
}
