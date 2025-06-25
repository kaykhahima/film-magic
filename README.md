# Film Magic - Project Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [Project Architecture](#project-architecture)
3. [Features](#features)
4. [Authentication](#authentication)
5. [Setup Instructions](#setup-instructions)
6. [API Integration](#api-integration)
7. [Database Structure](#database-structure)
8. [Navigation](#navigation)
9. [Theme Management](#theme-management)

## Introduction

Film Magic is a Flutter application that provides users with information about films, actors, and related content. The app integrates with The Movie Database (TMDB) API to fetch film data and uses Firebase for authentication.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


## Project Architecture

The project follows the **MVVM (Model-View-ViewModel)** architecture within a **Feature-First** project structure.

To learn more on Flutter with MVVM, visit [Using MVVM for your application's architecture](https://docs.flutter.dev/get-started/fwe/state-management#using-mvvm-for-your-applications-architecture).


### Core Architecture Components

- **Model**: Data structures defined using `dart_mappable` for serialization/deserialization
- **View**: Flutter widgets responsible for UI rendering
- **ViewModel**: Classes extending `ChangeNotifier` that manage UI state and business logic
- **Repository**: Abstracts data sources and provides a clean API for ViewModels

### Project Structure

```
lib/
├── core/                                 # Core utilities and configurations
│   ├── constants/                        # Application-wide constants
│   ├── database/                         # SQLite database implementation
│   ├── di/                               # Dependency Injection (get_it)
│   ├── errors/                           # Custom error/failure classes
│   ├── navigation/                       # Routing setup (go_router)
│   ├── network/                          # Network client configuration
│   ├── theme/                            # Theming configuration
│   └── utils/                            # Utility functions and helpers
│
├── features/                             # Feature-based modules
│   ├── actor/                            # Actor feature
│   │   ├── data/                         # Data layer
│   │   │   ├── datasources/              # Local and remote data sources
│   │   │   ├── models/                   # Data models
│   │   │   └── repositories/             # Repository implementation
│   │   └── presentation/                 # Presentation layer
│   │       ├── viewmodels/               # ViewModels
│   │       └── views/                    # UI screens and widgets
│   ├── authentication/                   # Authentication feature
│   ├── film/                             # Film feature
│   ├── home/                             # Home feature
│   └── profile/                          # Profile feature
│
├── shared/                               # Shared components
│   ├── models/                           # Shared models
│   └── widgets/                          # Shared widgets
│
├── firebase_options.dart                 # Firebase configuration
└── main.dart                             # Application entry point
```

## Features

The application is organized into several key features:

### Film Feature

- Browse now playing, popular, top-rated, and upcoming films
- View detailed information about films including synopsis, cast, and crew
- See similar films recommendations
- Offline caching of film data

### Actor Feature

- View detailed information about actors
- See filmography and biographical information
- Offline caching of actor data

### Authentication Feature

- User registration and login
- Google Sign-In integration
- Persistent authentication state
- User profile management

### Profile Feature

- User profile management
- Theme preference settings

## Authentication

The app uses Firebase Authentication for user management:

### Authentication Methods

- Google Sign-In

### Implementation

- `AuthRepository` abstracts authentication operations
- `AuthViewModel` manages authentication state and exposes it to the UI
- Authentication state is persisted locally using SQLite
- Offline authentication support when network is unavailable

## Setup Instructions

### Prerequisites

- Flutter SDK v3.32.0
- Dart SDK v3.8.0
- Firebase project
- TMDB API key

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Configure Firebase:
    - Create a Firebase project in the Firebase Console
    - Add Android and iOS apps to your Firebase project
    - Download and add the configuration files (`google-services.json` for Android and `GoogleService-Info.plist` for iOS)

4. Set up environment variables:
    - Create a `.env` file in the project root based on `.env.example`
    - Add your TMDB API credentials (see [API Integration](#api-integration))

5. Run the app: `flutter run`

## API Integration

The app integrates with The Movie Database (TMDB) API to fetch film and actor data.

### API Setup

1. Create an account on [TMDB](https://www.themoviedb.org/)
2. Generate an API key and read access token in your account settings
3. Add these credentials to your `.env` file:

```
TMDB_API_KEY=your_api_key_here
TMDB_API_READ_ACCESS_TOKEN=your_read_access_token_here
```

### API Client

The `ApiClient` class in `core/network/api_client.dart` handles all API requests with proper error handling and authentication.

## Database Structure

The app uses SQLite (via `sqflite`) for local data persistence:

### Main Tables

- **users**: Stores user information and preferences
- **films**: Basic film information
- **film_details**: Detailed film information
- **film_lists**: Metadata for film lists (now playing, popular, etc.)
- **film_categories**: Relationship between films and categories
- **collections**: Film collections information
- **genres**: Film genres
- **film_genres**: Relationship between films and genres
- **production_companies**: Production companies
- **film_production_companies**: Relationship between films and production companies
- **spoken_languages**: Languages spoken in films
- **film_spoken_languages**: Relationship between films and languages
- **production_countries**: Countries where films were produced
- **film_production_countries**: Relationship between films and countries
- **actors**: Actor information
- **actor_details**: Detailed actor information

## Navigation

The app uses `go_router` for navigation with a bottom navigation bar for main sections:

### Main Routes

- `/register`: Registration screen
- `/`: Home screen
- `/films`: Films screen
- `/film-details`: Film details screen
- `/actor-details`: Actor details screen
- `/profile`: Profile screen

## Theme Management

The app supports light, dark, and system default themes:

- Theme preferences are stored in the user profile
- `flex_color_scheme` is used for consistent theming
- Theme changes are managed by the `AuthViewModel`

        
