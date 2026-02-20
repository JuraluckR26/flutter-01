import 'package:intl/intl.dart';

class Money {
  static String thb(int value) {
    final f = NumberFormat.currency(symbol: '฿', decimalDigits: 0);
    return f.format(value);
  }
}
