import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  Button(this.message,this.colour);
  final String message;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container    (
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration
        (
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
      ),

      child:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(message,style: TextStyle
            (
            color: Colors.white,
            fontSize: 25.0,
          ),),
        ),
      ),
    );
  }
}