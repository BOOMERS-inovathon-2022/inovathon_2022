import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/components/title_divider.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_details/seller_details_page.dart';
import 'package:inovathon_2022/ui/theme/colors.dart';

class SellerDetailsWidget extends State<SellerDetailsPage> {
  List<String> images = [
    "https://imagensemoldes.com.br/wp-content/uploads/2020/07/Cenoura-PNG.png",
    "https://images.squarespace-cdn.com/content/v1/5b8edfa12714e508f756f481/1543944726778-3R28J0BST06GRZCOF7UR/alface-crespa-verde-hidropônica.png",
    "https://imagensemoldes.com.br/wp-content/uploads/2020/03/Foto-de-Batata-Grande-PNG-1024x911.png"
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TitleDivider(
          title: "Quem sou",
          endDivider: 270,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 40.0),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            textAlign: TextAlign.justify,
          ),
        ),
        const SizedBox(height: 25),
        const TitleDivider(
          title: "Produtos Populares",
          endDivider: 240,
        ),
        Flexible(
          child: SizedBox(
            width: double.infinity,
            height: 150,
            child: PageView.builder(
                itemCount: images.length,
                pageSnapping: false,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: kBorderColor),
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.only(right: 20),
                    child: FittedBox(
                      child: Image(
                        image: NetworkImage(
                          images[index],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
          ),
        ),
        const SizedBox(height: 25),
        const TitleDivider(
          title: "Minha Produção",
          endDivider: 250,
        ),
      ],
    );
  }
}
