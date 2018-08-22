import 'package:dd_movel/abas/aba_escolhida.dart';
import 'package:flutter/material.dart';

Widget getAbas(final GlobalKey<ScaffoldState> _scaffoldKey) {
  return DefaultTabController(
      length: opcoesAba.length,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Diário Digital'),
          bottom: TabBar(
            isScrollable: false,
            tabs: opcoesAba.map((OpcaoAba choice) {
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: opcoesAba.map((OpcaoAba choice) {
            return AbaEscolhida(choice: choice);
          }).toList(),
        ),
      ));
}
