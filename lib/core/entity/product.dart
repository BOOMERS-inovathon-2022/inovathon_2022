import 'package:inovathon_2022/core/entity/category.dart';
import 'package:inovathon_2022/core/entity/user_seller.dart';

class Product {
  late String id;
  late String name;
  late String description;
  late String measure;
  late double price;
  late bool isOrganic;
  late List<String> photoUrl;
  late Category category;
  late UserSeller seller;

  late String idParent;
}
