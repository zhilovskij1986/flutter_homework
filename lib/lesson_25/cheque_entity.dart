import 'package:flutter_homework/lesson_25/cheque_models.dart';

class ChequeEntity {
  final int chequeId;
  final double totalAmount;
  final List<String> items;
  final String prediction;

  ChequeEntity({
    required this.chequeId,
    required this.totalAmount,
    required this.items,
    required this.prediction,
  });

  factory ChequeEntity.fromDTO(ChequeResponseDto dto) {
    return ChequeEntity(
      chequeId: dto.chequeHeader.chequeId,
      totalAmount: dto.chequeHeader.sumReg,
      items: dto.chequeLines.map((line) => line.lagerNameUA).toList(),
      prediction: dto.chPrediction,
    );
  }
}
