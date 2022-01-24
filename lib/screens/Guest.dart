import 'package:flutter/material.dart';
import 'package:inventory_where/screens/guest/Auth.dart';
import 'package:inventory_where/screens/guest/Password.dart';
import 'package:inventory_where/screens/guest/Term.dart';

class GuestScreen extends StatefulWidget {
  GuestScreen({Key? key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<Widget> _widgets = [];
  int _indexSelected = 0;

  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      AuthScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      TermScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      PasswordScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
