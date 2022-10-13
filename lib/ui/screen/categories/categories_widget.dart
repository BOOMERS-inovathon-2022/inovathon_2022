import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/entity/category.dart';
import 'package:inovathon_2022/ui/shared/shared_input.dart';
import 'package:inovathon_2022/ui/theme/colors.dart';

import 'categories_page.dart';

class CategoriesWidget extends State<CategoriesPage> {
  List<Category> categories = [
    Category(
        name: "Verduras",
        description: "Verduras e legumes",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/424/424227.png"),
    Category(
        name: "Laticínios",
        description: "Queijos, leite, requeijão, etc",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/3753/3753934.png"),
    Category(
        name: "Orgânicos",
        description: "Somente produtos orgânicos",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/1588/1588024.png"),
    Category(
        name: "Frutas",
        description: "Maçã, Laranja, etc",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/415/415682.png"),
    Category(
        name: "Limpeza",
        description: "Produtos para limpeza",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/1656/1656569.png"),
    Category(
        name: "Doces",
        description: "Balas, bolos, etc",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/119/119676.png"),
    Category(
        name: "Peixes",
        description: "Tilápia",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/2371/2371907.png"),
    Category(
        name: "Carnes",
        description: "Bovinas, ovinas, etc",
        photoUrl: "https://cdn-icons-png.flaticon.com/512/1046/1046769.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: kBackgroundGreyColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SharedTextInput(
                  suffixIcon: const Icon(Icons.search),
                  inputBorder: InputBorder.none,
                  autofocus: true,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Categorias",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            getCategories(),
            const SizedBox(
              height: 20,
            ),
            // TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Voltar aos produtos"))
          ]),
        ),
      ),
    );
  }

  getCategories() {
    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 90,
        mainAxisExtent: 100,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            // FunctionWidgets().showLoading(context);
            // await Future.delayed(const Duration(seconds: 1));
            // Navigator.of(context).pop();
            //
            // CustomRouter.pushPage(
            //   context,
            //   ProductDetailPage(),
            // );
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: kBackgroundGreyColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(
                        15,
                      )),
                  child: Image.network(
                    categories[index].photoUrl,
                    // height: 100,
                  ),
                ),
                Text(
                  categories[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
