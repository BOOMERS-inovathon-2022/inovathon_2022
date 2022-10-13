class User {
  late String? id;
  late String name;
  late String email;
  late String password;
  late String phone;
  late String photoUrl;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.photoUrl});
}
