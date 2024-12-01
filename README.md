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

   4. **Use the Loader in Your Screens:**

   To display the loader in your application, you can easily access the `AppStatesServiceProvider` using `Provider.of` or `Consumer` in any widget where you want to show the loading animation. For example, in a screen where you want to show a loader during an API call:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:provider/provider.dart';
   import 'app_loading_animation.dart'; // Adjust the import to your actual file structure

   class YourHomePage extends StatefulWidget {
     @override
     _YourHomePageState createState() => _YourHomePageState();
   }

   class _YourHomePageState extends State<YourHomePage> {
     @override
     Widget build(BuildContext context) {
       // Access the AppStatesServiceProvider to control the loader
       AppStatesServiceProvider appStates = Provider.of<AppStatesServiceProvider>(context);
       
       return Scaffold(
         appBar: AppBar(title: Text('Loading Animation Example')),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               if (appStates.isLoading)
                 const CircularProgressIndicator(),  // Show loader when isLoading is true
               ElevatedButton(
                 onPressed: () async {
                   // Show the loader when the button is pressed
                   appStates.showLoader();
                   
                   // Simulate an API call
                   await Future.delayed(const Duration(seconds: 3));
                   
                   // Hide the loader after the task is complete
                   appStates.hideLoader();
                 },
                 child: const Text('Start API Call'),
               ),
             ],
           ),
         ),
       );
     }
   }