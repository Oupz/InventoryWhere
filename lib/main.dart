import 'package:flutter/material.dart';
import 'package:inventory_where/screens/Guest.dart';
import 'package:inventory_where/screens/guest/Auth.dart';
import 'package:inventory_where/screens/guest/Password.dart';
import 'package:inventory_where/screens/guest/Term.dart';

void main() => runApp(App());

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
