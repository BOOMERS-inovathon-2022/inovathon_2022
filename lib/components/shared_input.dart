import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SharedTextInput extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const SharedTextInput({
    Key? key,
    this.hintText,
    this.icon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        icon: Icon(
          icon,
        ),
        hintText: hintText,
        // contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
