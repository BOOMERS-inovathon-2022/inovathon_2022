import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/home/home_page.dart';
import 'package:inovathon_2022/ui/shared/function_widgets.dart';

import '../../theme/custom_router.dart';
import '../product_details/product_detail_page.dart';

class HomeWidget extends State<HomePage> {
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
                height: 150,
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
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 190,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        FunctionWidgets().showLoading(context);
                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.of(context).pop();

                        CustomRouter.pushPage(
                          context,
                          ProductDetailPage(),
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
                              "https://superprix.vteximg.com.br/arquivos/ids/178850-600-600/Alface-Crespa-Verde-Un-396.png?v=636934628540170000",
                              height: 130,
                            ),
                            const Text(
                              "Alface",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              "1 Kg",
                              style: TextStyle(
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
