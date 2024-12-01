# App Loading Animation

This project provides a customizable loading animation widget to be used throughout your Flutter application. The loader is particularly useful for displaying during long-running tasks like API calls, data processing, or any other asynchronous operations. The loader appears when an API call or task starts and disappears once the task is completed.

## Features

- **Global Loader Control:** The loader's visibility can be easily controlled using a provider (`AppStatesServiceProvider`), making it accessible across the app.
- **Reusable Component:** It can be invoked on any screen or widget in the app, making it a versatile solution for showing and hiding loading states.
- **Customizable Appearance:** The loader is designed to be easily customizable in terms of size, color, and transition effects to fit the design needs of your application.
- **Seamless User Experience:** The loader ensures that users are notified when tasks are in progress and when they are completed, improving the app's UX by providing clear visual feedback.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/app_loading_animation.git

2. **Install dependencies:**

   After cloning the repository, navigate to the project directory and run the following command to install all the required dependencies:

   ```bash
   flutter pub get

3. **Set up the Provider:**

   In order to control the loader's visibility across the app, you'll need to set up the `AppStatesServiceProvider` using the `provider` package. 

   In your `main.dart` file, add the following:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:provider/provider.dart';
   import 'app_loading_animation.dart'; // Adjust the import to your actual file structure

   void main() {
     runApp(
       ChangeNotifierProvider(
         create: (context) => AppStatesServiceProvider(),
         child: MyApp(),
       ),
     );
   }

   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         title: 'Flutter Demo',
         theme: ThemeData(
           primarySwatch: Colors.blue,
         ),
         home: YourHomePage(),
       );
     }
   }