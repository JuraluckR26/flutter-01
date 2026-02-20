import 'package:go_router/go_router.dart';

import '../features/discover/presentation/pages/discover_page.dart';
import '../features/item/presentation/pages/item_detail_page.dart';
import '../features/booking/presentation/pages/select_date_page.dart';
import '../features/booking/presentation/pages/booking_quote_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/discover',
    routes: [
      GoRoute(
        path: '/discover',
        builder: (context, state) => const DiscoverPage(),
      ),
      GoRoute(
        path: '/item/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ItemDetailPage(itemId: id);
        },
      ),
      GoRoute(
        path: '/booking/:itemId',
        builder: (context, state) {
          final itemId = state.pathParameters['itemId']!;
          return SelectDatePage(itemId: itemId);
        },
      ),
      GoRoute(
        path: '/booking/:itemId/quote',
        builder: (context, state) {
          final itemId = state.pathParameters['itemId']!;
          final startAt = DateTime.parse(state.uri.queryParameters['startAt']!);
          final endAt = DateTime.parse(state.uri.queryParameters['endAt']!);
          return BookingQuotePage(itemId: itemId, startAt: startAt, endAt: endAt);
        },
      ),
    ],
  );
}
