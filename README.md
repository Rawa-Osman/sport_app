
---

```markdown
# 🏟️ Sport App

A modular, scalable Flutter application for sports tracking. Designed with clean architecture in mind, it leverages BLoC for state management, GoRouter for navigation, and Dio for network handling. Built for performance, maintainability, and extensibility.

---

## 🚀 Features

- 🧭 Modern navigation with `go_router`
- 🔄 Real-time data updates via WebSockets
- ⚡ Clean BLoC architecture
- 🎨 Centralized theming and responsive design
- 📡 Network abstraction with Dio + connectivity check
- 📁 Feature-first folder structure
- 🧪 Easy to scale with future modules

---

## 🧱 Project Structure

The project is split into **core logic**, **features**, and **entry point**:

```

lib/
├── core/              # Shared resources across all features
│   ├── common/        # Reusable widgets (e.g., loaders)
│   ├── constants/     # Static values: colors, fonts, images, dimensions
│   ├── di/            # Dependency Injection setup
│   ├── error/         # Exception handling logic
│   ├── network/       # API config & connectivity checker
│   ├── repository/    # Shared repo helpers
│   ├── routes/        # go\_router setup & route definitions
│   ├── services/      # WebSocket or other external services
│   └── theme/         # App-wide theming (dark/light mode, text styles)
│
├── features/          # Feature-specific logic
│   └── home/          # "Home" feature module
│       ├── bloc/          # BLoC files (event, state, bloc)
│       ├── data/          # Data layer
│       │   ├── model/         # Models (e.g. HomeModel)
│       │   ├── repo/          # Repository logic for fetching/managing data
│       │   └── home\_provider/ # Service/provider for API calls
│       ├── pages/         # UI page screens (e.g. HomePage)
│       └── widgets/       # Feature-specific widgets
│
└── main.dart          # App entry point

````

---

## 🛠️ Getting Started

### ✅ Prerequisites

- Flutter version 3.24.5 on channel stable
- Dart version 3.5.4
    • DevTools version 2.37.3
- Java version OpenJDK Runtime Environment (build 17.0.11+0-17.0.11b1207.24-11852314)
- xcode
    • Build 16F6
    • CocoaPods version 1.16.2
- IDE: VSCode / Android Studio
- Emulator or real device

### 🚦 Installation

```bash
git clone https://github.com/Rawa-Osman/sport_app.git
cd sport_app
flutter pub get
````

### 🏃‍♂️ Run the app

```bash
flutter run
```

---

## 📦 Dependency Highlights

| Package              | Purpose                       |
| -------------------- | ----------------------------- |
| `flutter_bloc`       | BLoC state management         |
| `go_router`          | Declarative navigation        |
| `dio`                | Network requests              |
| `connectivity_plus`  | Internet connection status    |
| `web_socket_channel` | Real-time data via WebSockets |

> You can find all dependencies in `pubspec.yaml`.



---

## 🔁 State Management

BLoC pattern is used throughout the app (`flutter_bloc`) and follows the recommended structure:

* `home_bloc.dart`: Business logic
* `home_event.dart`: Inputs to the BLoC
* `home_state.dart`: Outputs from the BLoC

---

## 🚧 Development Tips

* Structure features under `/features/feature_name/`
* Keep logic separated: `bloc`, `data`, `pages`, `widgets`
* Use `core/` only for shared logic or utilities
* Register dependencies in `di/di_config.dart`

---

## 🧑‍💻 Contributing

Pull requests are welcome! For major changes, open an issue first to discuss what you’d like to change.

To contribute:

```bash
git checkout -b feature/your-feature-name
git commit -m "✨ Add your feature"
git push origin feature/your-feature-name
```

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 📬 Contact

* **Author:** Rawa Osman
* **GitHub:** [@Rawa-Osman](https://github.com/Rawa-Osman)

---

Built with 💙 using Flutter
