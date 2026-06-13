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
}
