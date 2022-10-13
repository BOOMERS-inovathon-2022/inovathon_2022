import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/theme/colors.dart';

class TitleDivider extends StatelessWidget {
  final String title;
  final double? endDivider;

  const TitleDivider({
    Key? key,
    required this.title,
    this.endDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      Divider(
        endIndent: endDivider,
        color: kDividerColor,
        thickness: 1,
      )
    ]);
  }
}
