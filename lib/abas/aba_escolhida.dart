import 'package:flutter/material.dart';
import 'package:dd_movel/abas/frequencia/aba_frequencia.dart';
import 'package:dd_movel/abas/conteudo/aba_conteudo.dart';

class OpcaoAba {
  const OpcaoAba({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<OpcaoAba> opcoesAba = <OpcaoAba>[
  OpcaoAba(title: 'FREQUÊNCIA', icon: Icons.person),
  OpcaoAba(title: 'CONTEÚDO', icon: Icons.assignment),
  OpcaoAba(title: 'NOTAS', icon: Icons.class_),
];

class AbaEscolhida extends StatelessWidget {
  const AbaEscolhida({Key key, this.choice}) : super(key: key);

  final OpcaoAba choice;

  static Widget abaEscolhida;

  @override
  Widget build(BuildContext context) {
    switch (this.choice.title) {
      case 'FREQUÊNCIA':
        {
          abaEscolhida = AbaFrequencia();
          break;
        }

      case 'CONTEÚDO':
        {
          abaEscolhida = AbaConteudo(context);
          break;
        }

      case 'NOTAS':
        {
          abaEscolhida = Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Aba Notas"),
            ],
          ));
          break;
        }

      default:
        break;
    }

    return abaEscolhida;
  }
}
