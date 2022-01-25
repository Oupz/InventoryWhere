import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inventory_where/models/UserModel.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  // Asynchronous system

  Future<UserModel> auth(UserModel userModel) async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password);

      print(userModel);
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    }
    userModel.setUid = userCredential.user!.uid;
    return userModel;
  }
}
