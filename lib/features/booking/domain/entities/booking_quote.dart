class BookingQuote {
  final String itemId;
  final DateTime startAt;
  final DateTime endAt;
  final int days;

  final int rentSubtotal;
  final int serviceFee;
  final int deposit;
  final int discount;
  final int totalPayNow;

  const BookingQuote({
    required this.itemId,
    required this.startAt,
    required this.endAt,
    required this.days,
    required this.rentSubtotal,
    required this.serviceFee,
    required this.deposit,
    required this.discount,
    required this.totalPayNow,
  });
}
