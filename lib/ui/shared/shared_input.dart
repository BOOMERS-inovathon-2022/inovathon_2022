import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SharedTextInput extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool obscureText;
  final bool autofocus;
  late ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final InputBorder? inputBorder;

  SharedTextInput({
    Key? key,
    this.hintText,
    this.icon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.autofocus = false,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.inputBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: inputBorder,
        // icon: Icon(
        //   icon,
        // ),
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
