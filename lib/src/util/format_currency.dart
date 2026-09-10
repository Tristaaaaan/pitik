import 'package:intl/intl.dart';

String formatCurrency(double? value) {
  final double amount = value ?? 0;

  return '₱${NumberFormat('#,##0.00').format(amount)}';
}
