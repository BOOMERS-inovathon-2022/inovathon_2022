import 'package:flutter/material.dart';

class SharedDropdown<T> extends StatelessWidget {
  final T? value;
  final IconData? icon;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;

  const SharedDropdown({
    Key? key,
    this.icon,
    this.items,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.only(left: icon != null ? 8 : 25, right: 8),
        child: DropdownButtonFormField<T>(
          decoration: const InputDecoration(border: InputBorder.none),
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
