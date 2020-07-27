
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final InputDecoration decoration;
  CustomInput({@required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.10),
              offset: Offset(0, 4),
              blurRadius: 10)
        ],
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            decoration: decoration,
          ),
        ],
      ),
    );
  }
}
