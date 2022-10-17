# WeBuyCars Asset Tracking Hackathon

Flutter starter application for the WeBuyCars asset tracking hackathon.

## Getting Started

Ensure you've installed Flutter and can run the [test drive example](https://docs.flutter.dev/get-started/test-drive) 
on an emulator or one of your devices. You can find all setup instructions [here](https://docs.flutter.dev/get-started/install). 
If you have any questions related to environment setup, please send a message to the Hackathon channel on Teams. 
If you've never worked with Flutter, a general recommendation is to try and compile to Android instead of iOS.

## Project Overview

This project is a starting point for a Flutter application. The project has commonly used dependencies 
already installed and demonstrates some key concepts in Flutter. 

- Custom widgets and UI composition
  - See [user_list_page.dart](lib/pages/users/user_list_page.dart).
  - See [user_card.dart](lib/widgets/user_card.dart).
  - See [home_page.dart](lib/pages/home_page.dart).
- Re-rendering UI based on changing data
  - See [user_list_page.dart](lib/pages/users/user_list_page.dart) lines 63, 89, and 95.
- Routing and passing data between pages
  - All routes are defined in the [router file](lib/router.dart).
  - To navigate to a new page, see [user_list_page.dart](lib/pages/users/user_list_page.dart) line 82.
  - To pass an object to a page, see [user_card.dart](lib/widgets/user_card.dart) line 24.
- Network interaction via REST APIs
  - The [apis directory](lib/apis) contains an end to end example. 
  - REST calls using the [http package](lib/apis/implementations/http_user_api.dart).
  - REST calls using the [dio package](lib/apis/implementations/dio_user_api.dart).
  - [Example model](lib/apis/models/user.dart).
- Local and global state management
  - TODO
- Dependency injection
  - The [dependencies.dart](lib/dependencies.dart) file demonstrates dependency injection config.
  - See [user_list_page.dart](lib/pages/users/user_list_page.dart) line 17 for an example of dependency injection (or service location if you want to get technical).

## Commonly Used Widgets

- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [Row](https://api.flutter.dev/flutter/widgets/Row-class.html)
- [Column](https://api.flutter.dev/flutter/widgets/Column-class.html)
- [Text](https://api.flutter.dev/flutter/widgets/Text-class.html)
- [TextButton](https://api.flutter.dev/flutter/material/TextButton-class.html)
- [Image](https://api.flutter.dev/flutter/widgets/Image-class.html)

You can find all framework provided layout widgets [here](https://docs.flutter.dev/development/ui/widgets/layout). 
The [material widget set](https://docs.flutter.dev/development/ui/widgets/material) contains many visually 
appealing / useful widgets. Alternatively, use the [widget catalogue](https://docs.flutter.dev/development/ui/widgets) 
or open source alternatives like [awesome flutter](https://github.com/Solido/awesome-flutter#ui) to find what you need.

## Helpful Resources

A few resources to get you started if this is your first Flutter project:

- [Finding and installing packages](https://docs.flutter.dev/development/packages-and-plugins/using-packages).
- [Easily convert JSON to Dart classes](https://javiercbk.github.io/json_to_dart).
- [Cookbook of common Flutter scenarios](https://docs.flutter.dev/cookbook).

## Recommended Reading

- [Dart 101](https://dart.dev/guides/language/language-tour)
- [Flutter Layout Constraints](https://docs.flutter.dev/development/ui/layout/constraints)
- [Flutter State Management](https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
