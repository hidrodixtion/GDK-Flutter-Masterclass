import 'package:flutter/material.dart';

class WidgetAngka extends StatelessWidget {
  final int angka;
  final Function func;

  WidgetAngka(this.angka, this.func);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "$angka",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}