import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({this.placeHolder, this.onPressed});

  final String placeHolder;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          labelText: placeHolder),
      onChanged: onPressed,
    );
  }
}
