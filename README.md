# Rental Marketplace (Flutter) — runnable template

This project is a **general rental marketplace** template:
- Deposit + escrow concept
- Owner approval
- **Confirm pickup** before payout (business rule)
- Feature-based Clean Lite structure
- go_router + Riverpod

## ✅ How to run
> If you don't have platform folders yet (android/ios/web), run this once inside the project folder:
```bash
flutter create .
```

Then:
```bash
flutter pub get
flutter run
```

## What works now (mocked)
- Discover page shows mock items
- Item detail
- Select date range
- Booking quote (computed locally, simulating `/bookings/quote`)
- Copy-ready structure for real backend integration

## Where to connect backend later
- `lib/core/api/api_client.dart` (Dio wrapper)
- `lib/core/api/endpoints.dart`
- Replace `Fake*Repository` with real remote datasources
