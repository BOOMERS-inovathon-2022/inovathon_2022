import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/product_details/product_detail_page.dart';

class ProductDetailWidget extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Image(
              image: NetworkImage(
                "https://i5.walmartimages.ca/images/Enlarge/006/949/6000196006949.jpg",
              ),
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
        ],
      ),
    );
  }
}
