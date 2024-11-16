# KF Sample App

This is a Flutter application built using **BLoC** for state management, **Isar** for local database storage, and following the **Clean Architecture** principles. The app supports dynamic environment configuration via `--dart-define`.

---

## Repository

The source code for this project is available at:  
[https://github.com/ergo-notch/kf_sample](https://github.com/ergo-notch/kf_sample)

---

## Features

- **BLoC** for predictable and testable state management.
- **Isar Database** for fast and efficient local data handling.
- **Clean Architecture** for maintainable and scalable codebase.
- Environment-specific configurations for flexibility.

---

## Installation Guide

Follow the steps below to install and run the app on your device:

### Prerequisites

Ensure you have the following installed on your system:

1. **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
2. **Dart SDK**: Bundled with Flutter.
3. **Isar CLI**: Required for database code generation. [Install Isar CLI](https://isar.dev/cli/).
4. A physical device or emulator (Android or iOS).

---

### Step 1: Clone the Repository

Clone the project to your local machine:

```bash
git clone https://github.com/ergo-notch/kf_sample.git
cd kf_sample
```

### Step 2: Clone the Repository

Run the following command to fetch the necessary dependencies:

```bash
flutter pub get
```

### Step 3: Generate Isar Code

Generate the database code using the Isar CLI:

```bash
flutter pub run build_runner build
```

### Step 4: Connect a Device or Start an Emulator

For Android: Connect your device via USB with developer mode enabled, or start an Android Emulator.
For iOS: Use a physical device with proper provisioning or start an iOS Simulator.

### Step 5: Run the App with Environment Variables

Use the flutter run command with --dart-define to specify the environment and API base URL:

```bash
flutter run --dart-define=ENV=development --dart-define=BASE_URL=https://jsonblob.com
```

Command Explanation:

ENV=development: Sets the app's environment to "development".
BASE_URL=https://jsonblob.com: Configures the API base URL.

## Project Structure

This project follows Clean Architecture, organized into the following layers:

```bash
kf_sample/
├── lib/
│   ├── main.dart                 # Entry point
│   ├── core/                     # Core utilities and constants
│   ├── features/                 # Feature modules
│   │   ├── data/                 # Data layer (repositories, models, data sources)
│   │   ├── domain/               # Domain layer (entities, use cases)
│   │   └── presentation/         # Presentation layer (BLoC, widgets, screens)
│   ├── database/                 # Isar database setup
│   ├── env_config.dart           # Environment variable loader
│   ├── di/                       # Dependency injection setup
│   └── utils/                    # General utilities
├── pubspec.yaml                  # Dependencies and assets
└── README.md                     # Project documentation
```

### Troubleshooting

If the Isar database code is not generated, ensure the Isar CLI is installed and the build runner command has been executed.
Ensure the environment variables are properly defined when running the app.
For iOS, verify your provisioning profile and device compatibility.

### License

This project is licensed under the MIT License. See the LICENSE file for more details.

```bash
### Key Points:
- Replace the `https://github.com/ergo-notch/kf_sample.git` URL if necessary.
- The guide assumes users have basic knowledge of Flutter development and device setup.
- Let me know if you need additional sections, like testing or deployment instructions!
```
