import 'package:admin_app_second_project/Home/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(color: Colors.blueAccent),
      ),
      home: const AdminHome(),
    );
  }
}
