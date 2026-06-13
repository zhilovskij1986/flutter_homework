import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_homework/lesson_25/cheque_entity.dart';
import 'package:flutter_homework/lesson_25/cheque_models.dart';

class ChequeRepository {
  Future<ChequeEntity> getChequeData() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/json/chek.json',
      );

      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      final ChequeResponseDto dto = ChequeResponseDto.fromJson(jsonMap);

      return dto.toEntity();
    } catch (e) {
      throw Exception('Не вдалося завантажити або розпарсити чек: $e');
    }
  }
}
