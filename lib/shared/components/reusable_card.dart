import 'package:flutter/material.dart';



class ReusableCard extends StatelessWidget {

  ReusableCard({@required this.colour,this.cardChild});
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
//        color: Color(0xFF1D1E33),
        color: colour,
      ),
    );
  }
}
