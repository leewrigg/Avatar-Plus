![](https://raw.githubusercontent.com/YudizAndroidNareshP/Avatar-Plus/main/screenshots/banner.png)

![GitHub code size](https://img.shields.io/github/languages/code-size/YudizAndroidNareshP/Avatar-Plus)
[![All Contributors](https://img.shields.io/github/all-contributors/YudizAndroidNareshP/Avatar-Plus)](#contributors-)
[![Pub](https://img.shields.io/pub/v/avatar_plus.svg)](https://pub.dartlang.org/packages/avatar_plus)

# Avatar Plus #

<img src="https://raw.githubusercontent.com/YudizAndroidNareshP/Avatar-Plus/development/screenshots/logo.gif?v=001" width="75">

**Avatar Plus** is a Flutter package that allows you to generate and customize unique avatars easily. With up to **12 billion unique avatars** possible, this package is perfect for creating profile pictures, gaming logos, or adding personalized touches to your design projects.

## Features

- **Generate Unique Avatars**: Create avatars based on any text input with just a click or a keyboard shortcut.
- **Customizable**: Integrate and customize avatars in your Flutter applications.
- **Randomized Associations**: Names and words are randomly assigned to avatars, ensuring each one is unique.
- **Free to Use**: Use any generated avatar freely across various applications.

## Demo

<img src="https://raw.githubusercontent.com/YudizAndroidNareshP/Avatar-Plus/development/screenshots/demo.gif?v=001" width="120">

## Sample Code

Here is a basic example demonstrating how to use the `avatar_plus` package with various
customization options:

```dart
AvatarPlus("Jonny")            
```

## Installation

Add the following line to your `pubspec.yaml` file under `dependencies`:

```yaml
dependencies:
  avatar_plus: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

To use **Avatar Plus** in your Flutter application:

### Import the Package

```dart
import 'package:avatar_plus/avatar_plus.dart';
```

### Basic Example

Here's a simple example of how to generate an avatar using **Avatar Plus**:

```dart
import 'package:flutter/material.dart';
import 'package:avatar_plus/avatar_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Plus example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Avatar Plus",
            style: TextStyle(fontSize: 40),
          ),
          Text("Yudiz Solutions Limited © 2024"),
          SizedBox(
            height: 20,
          )
        ],
      ),
      body: Center(
        child: AvatarPlus(
          "jonny",
          height: MediaQuery.of(context).size.width - 20,
          width: MediaQuery.of(context).size.width - 20,
        ),
      ),
    );
  }
}
```

### Additional Usage Examples

You can generate avatars in various formats using **Avatar Plus**:

#### 1. Get Avatar as a String
```dart
String svgCode = AvatarPlusGen.instance.generate("Jonny");
```

#### 2. Get Avatar String with Transparent Background
```dart
String svgCode = AvatarPlusGen.instance.generate("Jonny", trBackground: true);
```

#### 3. Get Avatar as an SVG Widget
```dart
Widget svgWidget = AvatarPlus("Jonny", height: 100, width: 100);
```

#### 4. Get Avatar SVG Widget with Transparent Background
```dart
Widget svgWidget = AvatarPlus("Jonny", trBackground: true, height: 100, width: 100);
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

## Contributions

Contributions are welcome! Please open an issue or submit a pull request on the [GitHub repository](https://github.com/YudizAndroidNareshP/Avatar-Plus) if you would like to contribute to **Avatar Plus**.

## Support

If you encounter any issues or have questions, feel free to open an issue on [GitHub](https://github.com/YudizAndroidNareshP/Avatar-Plus/issues).

## Visitors Count 
<img align="left" src = "https://profile-counter.glitch.me/Avatar-Plus/count.svg" alt ="Loading">
