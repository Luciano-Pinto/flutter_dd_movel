import 'package:dd_movel/apoio/dropdown.dart';
import 'package:flutter/material.dart';


List<String> unidades = [
  'O Mar',
  'O Céu',
  'A Água',
  'O Ar',
].toList();


SimpleDialog incDialog({BuildContext context}) {
  return new SimpleDialog(
    title: const Text('Conteúdo Ministrado'),
    children: <Widget>[
      new SimpleDialogOption(
          child: new Row(
            children: <Widget>[
              new Text(
                  'Unid. Didática'
              ),
              new DropdownWidget(unidades),
            ],
          )
      )
    ],
  );
}