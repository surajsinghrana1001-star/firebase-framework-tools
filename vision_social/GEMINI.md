# Vision Social App

## Project Overview
A social media application built with Flutter, featuring a "VisionOS" inspired glassmorphism design system.
Key features include video uploads, post creation, and real-time messaging.

## Tech Stack
- **Framework**: Flutter (Dart)
- **State Management**: Riverpod
- **Routing**: GoRouter
- **Design**: Custom Glassmorphism System
- **Dependencies**:
  - `flutter_riverpod`
  - `go_router`
  - `google_fonts`
  - `flutter_animate`
  - `uuid`
  - `intl`

## Architecture
- **MVVM**: Separation of logic and UI.
- **Feature-first**: Code organized by feature (Auth, Feed, Chat, etc.).
- **Shared Widgets**: Reusable glass components in `lib/shared`.

## Design System
- **Theme**: Dark mode only.
- **Material**: Glass (Blur + Translucency).
- **Typography**: Inter / SF Pro style.

## Routes
- `/login`: Authentication
- `/feed`: Main content stream
- `/create`: Post creation
- `/chat`: Messaging
- `/profile`: User details

## Changelog
- **Initial Setup**: Project creation, dependency installation.
- **Core UI**: Implemented `GlassContainer` and `AppTheme`.
- **Navigation**: Setup `GoRouter` with ShellRoute for bottom nav.
- **Features**: Scaffolding for Feed, Create, Chat, and Profile pages.
