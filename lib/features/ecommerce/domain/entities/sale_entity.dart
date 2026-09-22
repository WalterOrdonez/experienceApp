/// Entidad que representa una venta registrada
class SaleEntity {
  final String userId;
  final DateTime date;
  final double total;

  const SaleEntity({
    required this.userId,
    required this.date,
    required this.total,
  });
}
