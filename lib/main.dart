import 'package:admin_app_second_project/Home/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminHome(),
    );
  }
}
