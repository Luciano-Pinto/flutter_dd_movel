import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget(this._itens,{ Key key }) : super(key: key);

  final List<String> _itens;

  @override
  DropdownWidgetState createState() => DropdownWidgetState(_itens);
}

class DropdownWidgetState extends State<DropdownWidget> {
  DropdownWidgetState(this._itens) : super();

  final List<String> _itens;

  String _itemEscolhido;


  @override
  void initState() {
    _itemEscolhido = _itens.first;
    super.initState();
  }

  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: Text(value), duration: Duration(milliseconds: 500)));
  }

  void showMenuSelection(String value) {
    if (_itens.contains(value)){
      setState( () {_itemEscolhido = value;});
      showInSnackBar('Você selecionou: $_itemEscolhido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DropdownButton<String>(
                value: _itemEscolhido,
                items: _itens.map((String tempo) {
                  return DropdownMenuItem<String>(
                      value: tempo,
                      child: Text(
                          tempo,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                      ),
                  );
                }).toList(),
                onChanged: (selecao) {
                  setState(() {
                    _itemEscolhido = selecao;
                  });
                  showInSnackBar('Você selecionou: $_itemEscolhido');
                },
            )
        ]
      )
    );
  }
}