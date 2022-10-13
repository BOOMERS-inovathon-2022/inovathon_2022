import 'package:inovathon_2022/core/model/entity/user.dart';

class UserSeller {
  late User user;
  late String description;
  late List<String> tags;
  late bool isVerified;
  late double rating;
  late List<String> photosProduction;

  UserSeller({
    required this.user,
    required this.description,
    required this.tags,
    this.isVerified = false,
    required this.rating,
    required this.photosProduction,
  });
}
