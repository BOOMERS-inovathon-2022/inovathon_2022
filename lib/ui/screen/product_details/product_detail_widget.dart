import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/entity/user_seller.dart';
import 'package:inovathon_2022/ui/screen/product_details/product_detail_page.dart';

import '../../shared/shared_button.dart';
import '../../theme/custom_router.dart';
import '../chat/chat_page.dart';

class ProductDetailWidget extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Image(
              image: NetworkImage(
                "https://i5.walmartimages.ca/images/Enlarge/006/949/6000196006949.jpg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Text(
                      'Alface', //TODO nome do produto
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Text(
                          'Descrição',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                          ),
                          child: Text(
                            //TODO descrição do produto
                            'Lorem ipsum suscipit at donec bibendum suspendisse ante fermentum scelerisque et ipsum quam, dui cras ipsum est aptent quam laoreet senectus congue aliquam. non fermentum rutrum imperdiet etiam litora ut pretium, nec consequat lectus ut odio sollicitudin fermentum magna, condimentum porta leo sodales aenean iaculis. conubia lorem dapibus aenean, nam. ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: SharedButton(
                  text: 'Ver fornecedores',
                  onClickAction: () => showModalBottomSheet(
                    isDismissible: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => FractionallySizedBox(
                      heightFactor: 0.85,
                      child: SellerProductList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SellerProductList extends StatelessWidget {
  SellerProductList({super.key, this.sellerList});

  List<UserSeller>? sellerList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Fornecedores",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        const Divider(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: ((context, index) {
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListTile(
                      dense: true,
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: const Text(
                        "Markus Chico",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightGreen,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Orgânico",
                            style: TextStyle(color: Colors.green[900], fontSize: 11),
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => CustomRouter.pushPage(
                          context,
                          const ChatPage(),
                        ),
                        icon: const Icon(Icons.chat),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 5),
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
