import 'package:inovathon_2022/core/model/entity/address.dart';
import 'package:inovathon_2022/core/model/enums/gender_enum.dart';

class User {
  late String? id;
  late String name;
  late String email;
  late String password;
  late String phone;
  late String photoUrl;
  late List<Address> address;
  late GenderEnum gender;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.photoUrl,
    required this.address,
    required this.gender,
  });
}
