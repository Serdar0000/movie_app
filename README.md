# movie_app

A Flutter movie application using Clean Architecture with Flutter BLoC state management.

## Getting Started

### Prerequisites
- Flutter SDK >= 2.19.0
- Dart >= 2.19.0

### Environment Setup

1. **Create `.env` file from template:**
   ```bash
   cp .env.example .env
   ```

2. **Add your TMDB API credentials to `.env`:**
   ```
   TMDB_READ_ACCESS_TOKEN=your_token_here
   TMDB_BASE_URL=https://api.themoviedb.org/3
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

### Project Structure

- **lib/core/** - Core utilities, DI, networking, themes
- **lib/features/** - Feature modules (Home, Favorite, Detail)
  - **domain/** - Business logic and entities
  - **data/** - Data sources and repositories
  - **presentation/** - UI, BLoCs, and state management

### Architecture

This project follows **Clean Architecture** with:
- **Dio** for HTTP requests
- **Flutter BLoC** for state management
- **Freezed** for immutable models
- **GetIt** for dependency injection
- **SharedPreferences** for local storage

### Git & Deployment

**Important:** `.env` file is git-ignored for security. Follow these steps:

1. **Before pushing to Git:**
   ```bash
   git add .env.example .gitignore
   git commit -m "Add environment template and token management"
   ```

2. **Team members setup:**
   - Clone the repository
   - Copy `.env.example` to `.env`
   - Add their own TMDB token to `.env`
   - Never commit `.env` file

### Production Release

For production builds, use environment-specific `.env` files or CI/CD secrets:

- **Local development:** Use `.env` file (git-ignored)
- **CI/CD pipeline:** Inject variables via GitHub/GitLab CI secrets
- **Production:** Use secure secret management services
