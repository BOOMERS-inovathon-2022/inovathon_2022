import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/shared/shared_dropdown.dart';

import '../../../core/model/enums/gender_enum.dart';
import '../../shared/shared_button.dart';
import '../../shared/shared_input.dart';

class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GenderEnum? gender;

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
                  "Registre-se",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.2,
                  backgroundImage: const NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/2202/2202112.png',
                  ),
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
                    const SizedBox(height: 10),
                    SharedTextInput(
                      hintText: 'Nome',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    SharedTextInput(
                      hintText: 'Sobrenome',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                SharedDropdown<GenderEnum>(
                  value: gender,
                  items: GenderEnum.values.map<DropdownMenuItem<GenderEnum>>((GenderEnum value) {
                    return DropdownMenuItem<GenderEnum>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(GenderEnumExtension.genderIcon(value)),
                          SizedBox(width: 10),
                          Text(GenderEnumExtension.getEnumName(value)),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                child: SharedButton(
                  text: 'Entrar',
                  onClickAction: () => null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




