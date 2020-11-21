import 'package:flutter/material.dart';

class FactsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 493,
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
      ),
      padding: EdgeInsets.symmetric(vertical: 23),
      child: Center(child: Text("Facts")),
    );
  }
}
