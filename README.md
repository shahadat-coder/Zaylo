lib/
│
├── controllers/        # GetX controllers for managing state
│   ├── auth_controller.dart
│   ├── cart_controller.dart
│   └── product_controller.dart
│
├── models/             # Data models for products, user, orders, etc.
│   ├── product.dart
│   └── user.dart
│
├── screens/            # All UI screens
│   ├── home_screen.dart
│   ├── product_details.dart
│   ├── cart_screen.dart
│   ├── checkout_screen.dart
│   └── profile_screen.dart
│
├── services/           # Firebase service helpers
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   └── storage_service.dart
│
└── widgets/            # Reusable widgets like buttons, cards, etc.
├── product_card.dart
└── cart_item.dart
