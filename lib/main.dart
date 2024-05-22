import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/Views/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAdbMSGhl7wX5-0RViLiXN7RGx81NyCewE",
          appId: "1:848863722269:android:8f73963f30d7f78f543ff4",
          messagingSenderId: "848863722269",
          projectId: "iotproject-f2c40",
          authDomain: "com.example.iot_project",
          databaseURL: "https://iotproject-f2c40-default-rtdb.firebaseio.com",
          storageBucket: "iotproject-f2c40.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
