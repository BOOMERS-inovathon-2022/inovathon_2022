import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/address_registration/address_registration_page.dart';

import '../../shared/shared_button.dart';
import '../../shared/shared_input.dart';

class AddressRegistrationWidget extends State<AddressRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cadastro de Endereço',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              SharedTextInput(
                keyboardType: TextInputType.text,
                hintText: 'Logradouro',
              ),
              const SizedBox(height: 10),
              SharedTextInput(
                keyboardType: TextInputType.text,
                hintText: 'Bairro',
              ),
              const SizedBox(height: 10),
              SharedTextInput(
                keyboardType: TextInputType.number,
                hintText: 'Número',
              ),
              const SizedBox(height: 10),
              Container(
                child: SharedTextInput(
                  keyboardType: TextInputType.number,
                  hintText: 'CEP',
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomCenter,
                  child: SharedButton(
                    text: 'Salvar',
                    onClickAction: () => null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
