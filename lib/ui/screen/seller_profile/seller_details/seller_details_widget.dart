import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/components/title_divider.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_details/seller_details_page.dart';
import 'package:inovathon_2022/ui/theme/colors.dart';

class SellerDetailsWidget extends State<SellerDetailsPage> {
  List<List<String>> productsImages = [
    ["https://imagensemoldes.com.br/wp-content/uploads/2020/07/Cenoura-PNG.png", "Cenoura"],
    [
      "https://images.squarespace-cdn.com/content/v1/5b8edfa12714e508f756f481/1543944726778-3R28J0BST06GRZCOF7UR/alface-crespa-verde-hidropônica.png",
      "Alface"
    ],
    [
      "https://imagensemoldes.com.br/wp-content/uploads/2020/03/Foto-de-Batata-Grande-PNG-1024x911.png",
      "Batata"
    ],
    [
      "https://iguabagrande.tinocosupermercados.com.br/wp-content/uploads/2022/04/642.png",
      "Mandioca"
    ],
  ];
  List<String> productionImages = [
    "https://static.todamateria.com.br/upload/pe/ss/pessoascultivando-cke.jpg",
    "https://blog.belagro.com.br/content/uploads/2020/10/importância-da-agricultura-familiar-750x422.jpg",
    "https://www.camara.leg.br/midias/image/2021/12/img20210519120415306-1-768x512.jpeg",
    "https://blog4.mfrural.com.br/wp-content/uploads/2022/01/tarefas-familia.jpg",
  ];

  var carouselOptions = CarouselOptions(
    height: 200,
    aspectRatio: 16 / 9,
    viewportFraction: 0.8,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: TitleDivider(
            title: "Quem sou",
            endDivider: 270,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 40.0, left: 10),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: TitleDivider(
            title: "Produtos Populares",
            endDivider: 240,
          ),
        ),
        CarouselSlider.builder(
          itemCount: productsImages.length,
          options: CarouselOptions(
            height: 100,
            aspectRatio: 16 / 9,
            viewportFraction: 0.4,
            initialPage: 0,
          ),
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              border: Border.all(color: kBorderColor),
              borderRadius: BorderRadius.circular(20),
              // borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      // fit: BoxFit.fitHeight,
                      image: NetworkImage(
                        productsImages[itemIndex][0],
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      productsImages[itemIndex][1],
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: TitleDivider(
            title: "Minha Produção",
            endDivider: 250,
          ),
        ),
        CarouselSlider.builder(
          itemCount: productionImages.length,
          options: carouselOptions,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    productionImages[itemIndex],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
