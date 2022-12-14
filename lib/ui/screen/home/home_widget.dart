import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/dto/product_listing_dto.dart';
import 'package:inovathon_2022/ui/screen/home/home_page.dart';
import 'package:inovathon_2022/ui/shared/function_widgets.dart';

import '../../theme/custom_router.dart';
import '../product_details/product_detail_page.dart';

class HomeWidget extends State<HomePage> {
  var productList = [
    ProductListingDTO(
      id: "",
      name: "Alface",
      description: "Alface é uma hortense anual ou bienal, utilizada na alimentação humana desde cerca de 500 a.C.. Originária do Leste do Mediterrâneo, é mundialmente cultivada para o consumo em saladas, com inúmeras variedades de folhas, cores, formas, tamanhos e texturas.",
      photo:
          "https://superprix.vteximg.com.br/arquivos/ids/178850-600-600/Alface-Crespa-Verde-Un-396.png?v=636934628540170000",
      measure: "Un",
      quantityPerSale: 1,
    ),
    ProductListingDTO(
      id: "",
      name: "Tomate",
      description: "O tomate é uma fruta, apesar de normalmente ser usado como legume em saladas e pratos quentes. Seu nome científico é Lycopersicum esculentum L e é uma fruta rica em vitamina C, A, K, potássio e licopeno, que é um potente antioxidante.",
      photo:
          "http://d3ugyf2ht6aenh.cloudfront.net/stores/746/397/products/tomate-longa-vida1-e12545f3c4985942a915417674167711-640-0.png",
      measure: "Kg",
      quantityPerSale: 1,
    ),
    ProductListingDTO(
      id: "",
      name: "Cebola",
      description: "A cebola (Allium cepa) é uma hortaliça de grande consumo em todo o mundo. A mesma é originária da Ásia Central, tendo sido cultiva na Índia e na China desde tempos remotos e levada para a Pérsia, onde se propagou por toda a África e Europa. A cebola foi trazida para o Brasil pelos colonizadores portugueses.",
      photo:
          "https://static1.conquistesuavida.com.br/ingredients/9/54/26/69/@/24722--ingredient_detail_ingredient-2.png",
      measure: "Kg",
      quantityPerSale: 1,
    ),
    ProductListingDTO(
      id: "",
      name: "Milho",
      description: "Milho (Zea mays) é um cereal cultivado em grande parte do mundo e extensivamente utilizado como alimento humano ou para ração animal devido às suas qualidades nutricionais.",
      photo:
      "https://www.ruralsoft.com.br/wp-content/uploads/2016/08/milho.png",
      measure: "Kg",
      quantityPerSale: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Início',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            InkWell(
              onTap: () => null,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[50],
                ),
                width: double.infinity,
                height: 120,
                child: Center(
                  child: Text(
                    "Anuncie Aqui",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                const Text(
                  "Produtos da sua região",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                GridView.builder(
                  itemCount: productList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    var product = productList[index];
                    return InkWell(
                      onTap: () async {
                        FunctionWidgets().showLoading(context);
                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.of(context).pop();

                        CustomRouter.pushPage(
                          context,
                          ProductDetailPage(product),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              product.photo,
                              height: 130,
                            ),
                            Text(
                              "${product.name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${product.quantityPerSale} ${product.measure}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
