import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final String text;
  final Function onClickAction;

  const SharedButton({
    Key? key,
    required this.text,
    required this.onClickAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        onPressed: () => onClickAction,
      ),
    );
  }
}
