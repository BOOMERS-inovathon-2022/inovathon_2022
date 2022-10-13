import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/entity/user_seller.dart';

class SellerProfile extends StatefulWidget {
  final UserSeller? seller; // TODO - não pode ser null

  const SellerProfile({Key? key, required this.seller}) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
