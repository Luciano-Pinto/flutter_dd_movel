import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key key}) : super(key:key);

  @override
  CheckboxWidgetState createState() => new CheckboxWidgetState();
}

class CheckboxWidgetState extends State<CheckboxWidget> {
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return new Checkbox(
        value: _check,
        onChanged: (bool value) {
          this.setState(() {
            _check = !(_check);
          });
        }
    );
  }
}