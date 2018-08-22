import 'package:dd_movel/abas/conteudo/cont_inc_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotaoWidget extends StatefulWidget {
  BotaoWidget({this.label, this.icone, this.snackMsg, this.onPressed, Key key})
      : super(key: key);

  final String label;
  final Icon icone;
  final String snackMsg;
  final VoidCallback onPressed;

  @override
  BotaoWidgetState createState() => BotaoWidgetState(
      label: label, icone: icone, snackMsg: snackMsg, onPressed: onPressed);
}

class BotaoWidgetState extends State<BotaoWidget> {
  BotaoWidgetState(
      {this.label, this.icone, this.snackMsg, this.onPressed, this.child})
      : super();

  final String label;
  final Icon icone;
  final String snackMsg;
  final VoidCallback onPressed;
  final Widget child;

  void showInSnackBar(String value) {
    value != null
        ? Scaffold.of(context).showSnackBar(new SnackBar(
            content: Text(value), duration: Duration(milliseconds: 500)))
        : null;
  }

  Widget _selectMaterialBtn() {
    if (icone != null) {
      return IconButton(
          icon: this.icone,
          onPressed: () {
            showInSnackBar(this.snackMsg);
          });
    } else {
      return RaisedButton(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            showInSnackBar(this.snackMsg);
            onPressed();
            incDialog();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Theme.of(context).platform == TargetPlatform.iOS
            ? CupertinoButton(
                child: Text("Salvar"),
                onPressed: () {
                  showInSnackBar(this.snackMsg);
                  //            child.
                  // Variavel onPressed armazena o metodo a ser executado pelo botão.
                  // Executa se a variavel não for nula. Se for, não faz nada.
                  onPressed();
//                  incDialog();
                })
            : _selectMaterialBtn());
  }
}
