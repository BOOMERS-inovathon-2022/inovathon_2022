import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SellerTag extends StatelessWidget {
  final String tag;
  final Color color;

  const SellerTag({
    Key? key,
    required this.tag,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: color.withOpacity(0.8), borderRadius: BorderRadius.circular(100)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(toBeginningOfSentenceCase(tag)!,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        ));
  }
}
