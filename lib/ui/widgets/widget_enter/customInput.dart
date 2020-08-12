import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final Widget textField;

  CustomInput({
    @required this.textField,
  });

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
        children: <Widget>[widget.textField],
      ),
    );
  }
}
