import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/product_register/product_register_page.dart';
import 'package:inovathon_2022/ui/shared/shared_input.dart';

class ProductRegisterWidget extends State<ProductRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.2,
                  backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/2202/2202112.png',
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          right: 30,
                        ),
                        child: SharedTextInput(
                          keyboardType: TextInputType.text,
                          hintText: 'Nome do produto',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 30,
                        ),
                        child: SharedTextInput(
                          keyboardType: TextInputType.text,
                          hintText: 'Descrição',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
