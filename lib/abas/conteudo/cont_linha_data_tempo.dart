import 'package:flutter/material.dart';

import 'package:dd_movel/apoio/datepicker.dart';
import 'package:dd_movel/apoio/dropdown.dart';
import 'package:dd_movel/apoio/botao.dart';
import 'package:dd_movel/abas/conteudo/cont_inc_dialog.dart';

//import 'dart:async';

Container contLinhaDataTempo(BuildContext context) {
  final List<String> _tempos = [
    '1º Tempo',
    '2º Tempo',
    '3º Tempo',
    '4º Tempo',
    '5º Tempo',
    '6º Tempo',
  ].toList();

  return Container(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: DatePickerWidget(),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: BotaoWidget(
                    icone: Icon(
                      Icons.add,
                      color: Colors.green[500],
                    ),
                    snackMsg: "Insira Novo Conteúdo.",
                    onPressed: incDialog,
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: DropdownWidget(_tempos),
              )
            ],
          )
        ],
      ));
}
