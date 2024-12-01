import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // AppStatesServiceProvider appStates = Provider.of<AppStatesServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // // Conditionally display a loader or a message
            // if (appStates.isLoading)
            //   const CircularProgressIndicator() // Show loader if `isLoading` is true
            // else
            //   const Text('No Loader', style: TextStyle(fontSize: 18)),
            // const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Show the loader for 5 seconds
                // appStates.showLoader; // Correctly invoke the showLoader method

                print('showing loader');
                // AppStatesServiceProvider.instance.showLoader(); // Incorrectly invoke the showLoader method

                // Future.delayed(const Duration(seconds: 5)).then((_) {
                //   AppStatesServiceProvider.instance.hideLoader(); // Correctly invoke the hideLoader method
                print('hiding loader');
                Navigator.pop(context);

                // }
                // );
              },
              child: const Text('Show Loader for 5 Seconds'),
            ),
          ],
        ),
      ),
    );
  }
}