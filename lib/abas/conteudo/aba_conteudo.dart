import 'package:flutter/material.dart';

import 'package:dd_movel/abas/conteudo/cont_linha_data_tempo.dart';


class AbaConteudo extends StatelessWidget {
  const AbaConteudo(BuildContext context);

  @override
  Widget build(BuildContext context) {

    return new Column(
      children: <Widget>[
        contLinhaDataTempo(context),
      ],
    );
  }
}