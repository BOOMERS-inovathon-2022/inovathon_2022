import 'package:flutter/material.dart';

import '../../shared/shared_button.dart';
import '../../shared/shared_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: const Text(
                  "NOME DO APP",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.2,
                backgroundImage: const NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/2202/2202112.png',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 30,
                ),
                child: Column(
                  children: [
                    SharedTextInput(
                      hintText: 'E-Mail',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    SharedTextInput(
                      hintText: 'Senha',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.bottomCenter,
                  child: SharedButton(
                    text: 'Entrar',
                    onClickAction: () => null,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
