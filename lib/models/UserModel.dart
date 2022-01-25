class UserModel {
  // user id
  String? uid;
  final String email;
  final String password;

  // Constructeur
  UserModel({
    this.uid,
    required this.email,
    required this.password,
  });

  set setUid(value) => uid = value;

  // Convertir l'utilisateur en json
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
      };
}
