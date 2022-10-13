import 'package:flutter/material.dart';

class SharedCounter extends StatefulWidget {
  SharedCounter({required this.counter, required this.onSubtract, required this.onAdd});

  int counter;
  Function onSubtract;
  Function onAdd;

  @override
  State<SharedCounter> createState() => _SharedCounterState();
}

class _SharedCounterState extends State<SharedCounter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              widget.onSubtract();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "${widget.counter}",
              style: const TextStyle(fontSize: 18),
            ),
          ),
          InkWell(
            onTap: () {
              widget.onAdd();
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
