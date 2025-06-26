# Film Magic - Project Documentation

## Table of Contents

1. [Introduction](#introduction)
2. [Project Architecture](#project-architecture)
3. [Features](#features)
4. [Authentication](#authentication)
5. [Setup Instructions](#setup-instructions)
6. [API Integration](#api-integration)
7. [Database Structure](#database-structure)
8. [Caching Mechanism](#caching-mechanism)
9. [Navigation](#navigation)
10. [Theme Management](#theme-management)
11. [Known Issues](#known-issues)

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

## Caching Mechanism

### Film Caching

- **On-Demand Caching**: Films list are cached the first time a user loads the home screen and detailed film information are cached when a user views a film's details screen
- **Persistent Storage**: All film data is stored in the local SQLite database for future access
- **Offline Access**: Once cached, film details can be accessed without an internet connection

### Image Caching

- **Viewport-Based Caching**: Images are only cached when they appear in the device's viewport
- **Lazy Loading**: This approach optimizes memory usage and network bandwidth
- **Cache Management**: The app uses Flutter's `cached_network_image` package to handle image caching
- **Persistence**: Cached images remain available for offline viewing after initial loading. Consider checking the [Known Issues](#known-issues) section see image loading issues on iOS devices.

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
- To customize this specific theme, go to [Film Magic Theme Playground](https://rydmike.com/flexcolorscheme/themesplayground-latest/?config=H4sIAAZwXWgA_71XTW_aQBC951dYnCtknJQQbiFgCTVtokBaqRdrscd4lfWutR8EGuW_d3fBFDAflmDrG54382ae34rZjytPP42CoMWUM0WTKEESNbpeY5xBDsJ7Xkc8E_FgXjAuIfGCdtNvNwM_-Oq17rp-u3vtN75Uqs2AC8yoKdhpBs01BCWokHgG90XRQ3wUc0bIK02AP6VpH_E3nfBhkRadIC4juSjA1AGq8qjMjziIglEBq8IWPkNEWShL04Z9_VnSbtBBYgkHBGZI6h5XtH4N6COeZrKKlQsCdZpPCcwjnTNBPBImaW_zQvEUxbB3AJNUNuGKakKAJmacJ_rACONCI1NEBGzGH2EGZEe5ZcB0dyiTScnyH2iGp1ZOPVEPxW9Ly4xiYzybd2o4YaFRbLH156qyrz_s5hRV2Chj7yMgEGv_P6IJkBqDmZxX7c8jWXGGix7j2mAvKMHKhFvBRmwEMaN6-kXJfUmJCo5zXXpboiXr_yJTQos24JzxE4fncOEwvA1b_Vb_YOVTh-VY6UF4o599pZ-X8zwwKhGmcE7_7cD378M6JOeM0hn4fjg4wuJyAlP7BVJXrTvVxRZ30fz6cF_CRK0wuLu-rUdzjlzhdXgTto_yuJ3iPCvVaN-xOmfa6TDDGLjEzt1UYXEjV0njdAZXVirru5XGgZEwLZTsa6dyJBk_tJhso4YixGZN3tlsmJJE2yPpKb0X0aflL-cLhYhRmjJid9ehGHMFPaLXy53eSpRVcCh-ZVhCBWLoh3r1n-tI-658bdbAVUiLsHfFFThXxCijLzhlAX839sByfXcBKsVByE8M778Zy3Ws43fK6HKt_c6S-teNVU6U66S9UhKzye8IucwZYyov_ecq3rGMs3Gm8kmI53rLxH8q6v-DXNIyjD7vM400aUbRUwQWeERGK9R2aVbg2H7hgb7eYEsRVGIjqalW0ZtVVK0vDmM2nRIYCqtB5ZwpAd9gsW3Eq8-_yXqsS9wPAAA=)
- Theme changes are managed by the `AuthViewModel`

## Known Issues

The following are known issues in the current version of Film Magic:

### Performance Issues

- **Slow Image Loading on iOS Devices**: Images may load slowly on iOS devices when in offline mode

### Workarounds

For slow image loading on iOS:
- For faster media retrieval, ensure you are online    
