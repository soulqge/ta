import 'package:intl/intl.dart';

String formatAmount(double jumlah,){
  final format = NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 2);
  return format.format(jumlah);
}