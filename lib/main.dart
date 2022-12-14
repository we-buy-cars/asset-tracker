import 'package:flutter/material.dart';

import 'dependencies.dart';
import 'router.dart';

void main() async {
  // Do any required initialisation here.
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencies();

  runApp(const AssetTrackerApp());
}

class AssetTrackerApp extends StatelessWidget {

  const AssetTrackerApp({ super.key });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Asset Tracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      routerConfig: appRouter,
    );
  }
}
