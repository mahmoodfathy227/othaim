import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:othaim/screens/home_screen.dart';

import 'bindings/app_binding.dart';

void main() async {
  // Ensure initialized GetStorage and Connectivity before runApp
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Connectivity().checkConnectivity(); // Initialize Connectivity

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create GetMaterialApp with bindings
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
            accentColor: Colors.teal,
          ),
          primaryColor: Colors.teal.shade100,
          primarySwatch: Colors.teal,
          fontFamily: 'circularStd',
          scaffoldBackgroundColor: Colors.white,
          buttonTheme: const ButtonThemeData(buttonColor: Colors.teal),
          textTheme: Theme.of(context).primaryTextTheme.apply(
                fontFamily: 'circularStd',
                bodyColor: Colors.black,
                displayColor: Colors.black,
              )),
      title: 'Othaim E-Commerce App',
      home: HomeScreen(),
    );
  }
}
