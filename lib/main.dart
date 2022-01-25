import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventory_where/screens/Guest.dart';

void main() async {
  // Initialize all widgets before continue
  WidgetsFlutterBinding.ensureInitialized();

  // Connect app to google-services.json
  await Firebase.initializeApp();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InventoryWhere',
      home: GuestScreen(),
    );
  }
}
