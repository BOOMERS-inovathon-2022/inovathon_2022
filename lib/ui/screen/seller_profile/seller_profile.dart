import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/entity/user_seller.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/components/seller_tag.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_details/seller_details_page.dart';

class SellerProfile extends StatefulWidget {
  final UserSeller? seller; // TODO - não pode ser null

  const SellerProfile({Key? key, required this.seller}) : super(key: key);

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 110,
                  height: 110,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i1.sndcdn.com/artworks-lq81iGn8UqOkdpTt-IawAKw-t500x500.jpg",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Manoel Gomes",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                        ),
                        SizedBox(
                          width: 33,
                          // height: 20,
                          child: Image(
                            image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/7595/7595571.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        SellerTag(
                          tag: "Produtos Orgânicos",
                          color: Color.fromARGB(255, 145, 224, 127),
                        ),
                        SizedBox(width: 5),
                        SellerTag(
                          tag: "Blue Pen",
                          color: Color.fromARGB(255, 113, 151, 236),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Expanded(child: SellerDetailsPage())
          ]),
        ),
      ),
    );
  }
}
