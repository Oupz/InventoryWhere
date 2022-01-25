import 'package:flutter/material.dart';
import 'package:inventory_where/Services/UserService.dart';
import 'package:inventory_where/models/UserModel.dart';
import 'package:inventory_where/screens/guest/Auth.dart';
import 'package:inventory_where/screens/guest/Password.dart';
import 'package:inventory_where/screens/guest/Term.dart';

class GuestScreen extends StatefulWidget {
  GuestScreen({Key? key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();

  List<Widget> _widgets = [];
  int _indexSelected = 0;

  late String _email;

  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      AuthScreen(
        onChangedStep: (index, value) => setState(() {
          _indexSelected = index;
          _email = value;
        }),
      ),
      TermScreen(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      PasswordScreen(
        onChangedStep: (index, value) => setState(() {
          if (index != null) {
            _indexSelected = index;
          }

          if (value != null) {
            _userService
                .auth(UserModel(email: _email, password: value))
                .then((user) => print(user.toJson()));
          }
        }),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
