class Item {
  final String id;
  final String title;
  final int pricePerDay;
  final int deposit;
  final String currency;
  final String category;
  final double rating;

  const Item({
    required this.id,
    required this.title,
    required this.pricePerDay,
    required this.deposit,
    required this.currency,
    required this.category,
    required this.rating,
  });
}
