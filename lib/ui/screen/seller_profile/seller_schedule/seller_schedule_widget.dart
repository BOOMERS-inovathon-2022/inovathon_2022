import 'package:flutter/material.dart';
import 'package:inovathon_2022/core/model/dao/product_checkout_dto.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_schedule/seller_schedule_page.dart';
import 'package:inovathon_2022/ui/shared/shared_button.dart';
import 'package:inovathon_2022/ui/shared/shared_counter.dart';

class SellerScheduleWidget extends State<SellerSchedulePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ProductCheckoutModal extends StatefulWidget {
  ProductCheckoutModal(this.productList);

  List<ProductCheckoutDTO> productList;

  @override
  State<ProductCheckoutModal> createState() => _ProductCheckoutModalState();
}

class _ProductCheckoutModalState extends State<ProductCheckoutModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Finalizar Pedido",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        const Divider(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: widget.productList.length,
            itemBuilder: ((context, index) {
              var product = widget.productList[index];
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Row(
                      children: [
                        Image.network(
                          product.photoUrl,
                          fit: BoxFit.fill,
                          width: 150,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                product.isOrganic
                                    ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.lightGreen,
                                        ),
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          "Orgânico",
                                          style: TextStyle(
                                            color: Colors.green[900],
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Text(
                              "${product.quantityPerSale}${product.measure}, R\$${product.price.toStringAsFixed(2)}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            SharedCounter(
                              counter: product.quantity,
                              onSubtract: () {
                                setState(() {
                                  if (product.quantity > 0) {
                                    product.quantity--;
                                  }
                                });
                              },
                              onAdd: () {
                                setState(() {
                                  product.quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
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
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SharedButton(text: "Comprar", onClickAction: () => null),
        )
      ],
    );
  }
}
