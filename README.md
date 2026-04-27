# Ridge Finance

A modern Flutter stock watchlist application that allows users to track and manage their favorite stocks with real-time data and interactive charts.

## Overview

Ridge Finance is a mobile application built with Flutter that provides users with the ability to create and manage stock watchlists, view real-time stock data, and analyze stock performance through interactive charts. The app features authentication, a clean modern UI, and integration with financial data APIs.

## Design

**Figma Design:** [Ridge Finance UI/UX](https://www.figma.com/design/cOdB3Pr6Gcwy9XN6ZdulQH/Ridge-Finance?m=auto&t=UOBangpea5GWtzFV-6)

## Tech Stack

### Framework & Language
- **Flutter** (SDK ^3.9.2) - Cross-platform mobile framework
- **Dart** - Programming language

### State Management & Architecture
- **flutter_bloc** (^9.1.1) - BLoC pattern for state management
- **equatable** (^2.0.8) - Value equality for Dart classes
- **freezed** (^3.2.4) - Code generation for immutable classes
- **json_serializable** (^6.11.3) - JSON serialization

### Dependency Injection
- **get_it** (^9.2.0) - Service locator for dependency injection
- **injectable** (^2.7.1+4) - Code generation for GetIt

### Navigation
- **auto_route** (^11.1.0) - Declarative routing solution
- **auto_route_generator** (^10.4.0) - Code generation for routes

### Backend & Authentication
- **supabase_flutter** (^2.12.0) - Backend as a service (BaaS)
- **shared_preferences** (^2.5.4) - Local data persistence

### Networking
- **dio** (^5.9.0) - HTTP client for API requests

### Financial Data APIs
- **FMP (Financial Modeling Prep)** - Stock market data
- **Finnhub** - Real-time stock data

### UI Components & Visualization
- **fl_chart** (^1.1.1) - Interactive charts and graphs
- **flutter_animate** (^4.5.2) - Animation utilities
- **skeletonizer** (^2.1.2) - Skeleton loading screens
- **google_fonts** (^7.0.0) - Custom fonts
- **flutter_form_builder** (^10.2.0) - Form building utilities
- **animated_flip_counter** (^0.3.4) - Animated number counters

### Utilities
- **flutter_dotenv** (^6.0.0) - Environment variable management
- **intl** (^0.20.2) - Internationalization and date formatting
- **url_launcher** (^6.3.1) - Launch URLs in external applications

## Project Structure

```
lib/
├── core/
│   ├── bloc/              # Global BLoCs (session management)
│   ├── config/            # App configuration (routing)
│   ├── di/                # Dependency injection setup
│   ├── services/          # Core services (caching, etc.)
│   ├── theme/             # App theming
│   ├── utils/             # Utilities (colors, dimensions, validators)
│   └── widgets/           # Reusable widgets
│       ├── button/
│       ├── input_fields/
│       └── status_image/
└── features/
    ├── auth/              # Authentication feature
    │   ├── bloc/          # Auth state management
    │   ├── models/        # Auth models
    │   ├── pages/         # Login/Register pages
    │   └── repositories/  # Auth data layer
    └── watchlist/         # Watchlist feature
        ├── bloc/          # Watchlist state management
        ├── models/        # Stock/watchlist models
        ├── pages/         # Watchlist pages
        ├── repositories/  # Watchlist data layer
        └── widgets/       # Feature-specific widgets
```

## Getting Started

### Prerequisites

- Flutter SDK ^3.9.2
- Dart SDK
- iOS development: Xcode, CocoaPods
- Android development: Android Studio, Android SDK

### Environment Setup

1. Clone the repository:
```bash
git clone <repository-url>
cd ridge_fin
```

2. Copy the environment example file and fill in your API keys:
```bash
cp .env.example .env
```

3. Add your API keys to `.env`:
```env
FMP_KEY=your_financial_modeling_prep_api_key
FINNHUB_KEY=your_finnhub_api_key
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

### Installation

1. Install dependencies:
```bash
flutter pub get
```

2. Generate code (routes, dependency injection, JSON serialization):
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

3. Run the app:
```bash
flutter run
```

## Features

- **User Authentication**: Secure login and registration with Supabase
- **Stock Watchlist**: Create and manage multiple watchlists
- **Real-time Data**: Live stock prices and market data
- **Interactive Charts**: Visualize stock performance with fl_chart
- **Modern UI**: Clean, responsive interface with smooth animations
- **Offline Support**: Local caching for improved performance

## API Keys

This application requires API keys from the following services:

1. **Financial Modeling Prep (FMP)**: [Get API Key](https://financialmodelingprep.com/developer/docs/)
2. **Finnhub**: [Get API Key](https://finnhub.io/)
3. **Supabase**: [Create Project](https://supabase.com/)

## Development

### Code Generation

Run this command after making changes to files with code generation annotations:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or use watch mode during development:

```bash
flutter pub run build_runner watch
```

### Testing

Run tests:
```bash
flutter test
```

## Author

Created by Fidel Hen

## License

This project is private and not published to pub.dev.
