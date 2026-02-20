class Endpoints {
  static const baseUrl = 'https://api.example.com';

  static const items = '/items';
  static String itemDetail(String id) => '/items/$id';

  static const quote = '/bookings/quote';
  static const createBooking = '/bookings';

  static const orders = '/orders';
  static String confirmPickup(String orderId) => '/orders/$orderId/pickup/confirm';
  static String reportIssuePickup(String orderId) => '/orders/$orderId/pickup/report-issue';
}
