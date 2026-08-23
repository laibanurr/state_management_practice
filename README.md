# 🚀 Flutter State Management Lab

A hands-on sandbox project dedicated to exploring, comparing, and mastering different state management architectures in Flutter.

## 📌 Featured State Managers

- **BLoC (Business Logic Component)** - Event-driven reactive state management.
- **Cubit** - A simplified subset of BLoC using direct functions instead of events.
- **Provider** - Wrapper around `InheritedWidget` for clean dependency injection and state propagation.
- **Riverpod** - Compile-safe, flexible, and decoupled evolution of Provider.

## 📂 Architecture & Directory Layout

Each approach follows a clean presentation-logic-data separation to reflect real-world app structure:

```text
lib/src/
├── bloc/       # Event-driven BLoC implementation
├── cubit/      # Simplified Cubit implementation
├── provider/   # ChangeNotifier & Provider implementation
└── riverpod/   # Riverpod 2.x Notifier & Provider implementation