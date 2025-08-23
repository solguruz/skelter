# Skelter Project

A comprehensive Flutter skelter project incorporating best practices, modern architecture, and boiler plate code for rapid application development.

## Technology Stack

- **Flutter Version:** ^3.32.0
- **Dart SDK:** ^3.8.0
- **State Management:** BLoC
- **Navigation:** Auto Route
- **Backend Integration:** Firebase (Core, Analytics, Crashlytics, Auth)
- **Authentication:** Firebase Auth, Google Sign-In, Apple Sign-In
- **UI Components:** Custom widgets, Flutter SVG, Shimmer effects
- **Testing:** Flutter Test, Bloc Test, Alchemist (Golden Tests), Mocktail
- **Code Generation:** Build Runner, Auto Route Generator, Flutter Gen Runner

## Getting Started

### Flavors
This project supports three flavors:
- **dev**
- **stage**
- **prod**

### Environment Variables
Create a `.env` file in the project root directory with the following values:

```
DEV_API_BASE_URL=https://dev.example.com/api
STAGE_API_BASE_URL=https://stage.example.com/api
PROD_API_BASE_URL=https://prod.example.com/api
```

Replace the URLs with your actual API endpoints.

### Building APK/IPA
To build for a specific flavor, use the following commands:

**Android APK (dev flavor):**
```
flutter build apk --flavor dev --dart-define=APP_FLAVOR=DEV
```

**iOS IPA (prod flavor):**
```
flutter build ipa --export-method=ad-hoc --flavor prod --dart-define=APP_FLAVOR=PROD 
```

## Architecture and Coding Standards

This project follows a clean architecture approach with BLoC pattern for state management, ensuring:

### Code Organization

- **Separation of Concerns**: UI, business logic, and data access are kept separate
- **Modular Structure**: Features are organized into independent modules
- **Dependency Injection**: Services and repositories are properly injected
- **Testability**: All components are designed to be easily testable
- **Widget Best Practices**: Keep widgets small and create classes instead of helper methods
- **Bloc Usage**: Get values from bloc with context.select() instead of passing in widget parameters

### BLoC Architecture

The project uses the BLoC (Business Logic Component) pattern to separate business logic from UI:

- **Events**: Input events triggered by user interactions
- **States**: Output states representing UI changes
- **BLoCs**: Components that convert events to states

Code structure follows this pattern:
```
feature/
├── bloc/
│   ├── feature_bloc.dart
│   ├── feature_event.dart
│   ├── feature_state.dart
├── models/
├── repository/
└── screens/
```

### Coding Guidelines

- Use `final` and `const` where appropriate
- Follow the [Flutter style guide](https://dart.dev/guides/language/effective-dart/style)
- Keep methods small and focused
- Write meaningful comments for complex logic
- Use proper naming conventions (camelCase for variables/methods, PascalCase for classes)

## Localization

The project is set up with Flutter's internationalization system:

- Localization files are located in `lib/i18n/`
- Base ARB file is `app_en.arb` 
- The output localization file is `app_localizations.dart`

To add a new language:
1. Create a new ARB file in the `lib/i18n/` directory (e.g., `app_es.arb`)
2. Run `flutter gen-l10n` to generate localization code
3. Access translations using `AppLocalizations.of(context).translationKey`

## Assets Management

Assets are organized as follows:

- **Icons**: Located in `assets/icons/` (SVG and PNG formats)
- **Images**: Located in `assets/images/`
- **Fonts**: Located in `assets/fonts/Inter/`

The project uses code generation for type-safe asset access. When adding new assets:

1. Add the asset to the appropriate directory
2. Run `flutter pub run build_runner build` to update generated asset references
3. Access assets using the generated constants

## Golden Testing

The project uses Alchemist for golden testing, a powerful tool for UI regression testing.

### What are Golden Tests?

Golden tests compare the rendered UI to a "golden" reference image. This helps detect unintended visual changes during development.

### How to Use Golden Tests

1. **Creating a Golden Test**:
   ```dart
   goldenTest(
     'Widget renders correctly',
     builder: () => GoldenTestGroup(
       children: [
         GoldenTestScenario(
           name: 'default state',
           child: YourWidget(),
         ),
       ],
     ),
   );
   ```

2. **Running Tests**:
   ```bash
   flutter test --update-goldens test/golden_test.dart  # Update golden files
   flutter test test/golden_test.dart                   # Run tests against existing golden files
   ```

3. **Managing Golden Files**:
   - Golden files are stored in the `test/goldens/` directory
   - Use `copy_golden_images.sh` script to copy golden images to the linux directory for CI/CD environments

For more details, refer to the **Technical Document on Golden Test Cases** and **alchemist** library.

## Git Workflow & Contribution Guidelines

### Branching Strategy

We use GitLab for version control with the following branch structure:

- `main`: Production-ready code
- `develop`: Integration branch for features
- `feature/[feature-name]`: For new features
- `bugfix/[bug-description]`: For bug fixes
- `hotfix/[hotfix-description]`: For urgent production fixes

### Pull Request Process

1. Create a branch from `develop` for your task
2. Make your changes and test thoroughly
3. Push your branch and create a Merge Request to `develop`
4. Ensure CI passes and request reviews
5. Address review comments
6. Request for review and merge the PR

### Commit Guidelines

- Use clear, descriptive commit messages
- Reference issue numbers in commits and PRs
- Keep commits focused on single logical changes

## Important Links

- **Repository**: [GitLab](https://gitlab.solguruzsolutions.com/flutter/flutter-skeleton)
- **UI Design**: [Figma](https://www.figma.com/design/UAlwJgBc22roZbBbhazeuz/Common-Design?m=auto&t=Q9noRhDkDETSvQy5-6)
- **Firebase Console**: [Firebase Project](https://console.firebase.google.com/u/1/project/sg-skeleton/settings/general/android:com.solguruz.flutter_skeleton)

## How to Contribute

1. Understand the project structure and coding standards
2. Pick an issue from the issue tracker or create a new one
3. Follow the Git workflow described above
4. Ensure your code passes all tests
5. Submit a Pull Request with a clear description of changes

We appreciate your contributions to make this skelter project even better!
