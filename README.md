
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


lib
├── core
│   ├── common
│   │   └── widget
│   │       └── circularl_loader_widget.dart
│   ├── constants
│   │   ├── api_constants.dart
│   │   ├── app_colors.dart
│   │   ├── app_dimentions.dart
│   │   ├── app_fonts.dart
│   │   └── app_images.dart
│   ├── di
│   │   └── di_config.dart
│   ├── error
│   │   └── exceptions.dart
│   ├── network
│   │   ├── dio_config.dart
│   │   └── internet_checker.dart
│   ├── repository
│   │   └── repository_helper.dart
│   ├── routes
│   │   ├── go_router_config.dart
│   │   └── routes.dart
│   ├── services
│   │   └── web_socket_service.dart
│   └── theme
│       └── app_theme.dart
├── features
│   └── home
│       ├── bloc
│       │   ├── home_bloc.dart
│       │   ├── home_event.dart
│       │   └── home_state.dart
│       ├── data
│       │   ├── home_provider
│       │   │   └── home_provider.dart
│       │   ├── model
│       │   │   └── home_model.dart
│       │   └── repo
│       │       └── home_repo.dart
│       ├── pages
│       │   └── home_page.dart
│       └── widgets
│           ├── background_widget.dart
│           ├── competition_widget.dart
│           ├── match_tab_builder.dart
│           ├── match_widget.dart
│           └── tab_button.dart
└── main.dart

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
