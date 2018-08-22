import 'dart:async';

import 'package:dd_movel/abas/conteudo/aba_conteudo.dart';
import 'package:dd_movel/abas/frequencia/aba_frequencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getAbasCupertino() {
  return new WillPopScope(
    // Prevent swipe popping of this page. Use explicit exit buttons only.
    onWillPop: () => new Future<bool>.value(true),
    child: new CupertinoTabScaffold(
      tabBar: new CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Frequencia'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.assignment),
            title: const Text('Conteúdo'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(Icons.class_),
            title: const Text('Notas'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return new DefaultTextStyle(
          style: const TextStyle(
            fontFamily: '.SF UI Text',
            fontSize: 17.0,
            color: CupertinoColors.black,
          ),
          child: new CupertinoTabView(
            builder: (BuildContext context) {
              switch (index) {
                case 0:
                  return new AbaFrequencia();
                  break;
                case 1:
                  return new AbaConteudo(context);
                  break;
                case 2:
                  return new Container(
                      child: new Column(
                        children: <Widget>[
                          new Text("Aba Notas"),
                        ],
                      )
                  );
                  break;
                default:
              }
            },
          ),
        );
      },
    ),
  );
}