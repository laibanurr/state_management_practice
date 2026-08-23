# 🚀 Flutter State Management Lab

A hands-on sandbox project maintained by **[laiba](https://github.com/laibanurr)** dedicated to exploring, comparing, and mastering different state management architectures in Flutter.

## 📌 Featured State Managers

- **BLoC (Business Logic Component)** - Event-driven reactive state management.
- **Cubit** - A simplified subset of BLoC using direct functions instead of events.
- **Provider** - Wrapper around `InheritedWidget` for clean dependency injection and state propagation.
- **Riverpod** - Compile-safe, flexible, and decoupled evolution of Provider.

## 📂 Architecture & Directory Layout

This project follows a clean `data -> logic -> presentation` architecture inside `lib/src/`:

```text
lib/
├── main.dart
└── src/
    ├── bloc/       # Event-driven BLoC implementation
    ├── cubit/      # Simplified Cubit implementation
    ├── provider/   # ChangeNotifier & Provider implementation
    └── riverpod/   # Riverpod Notifier & Provider implementation