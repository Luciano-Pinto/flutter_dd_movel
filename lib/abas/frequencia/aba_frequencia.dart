import 'package:dd_movel/apoio/botao.dart';
import 'package:dd_movel/apoio/datepicker.dart';
import 'package:dd_movel/apoio/dropdown.dart';
import 'package:dd_movel/io/bloc.dart';
import 'package:dd_movel/model/aluno.dart';
import 'package:flutter/material.dart';

final List<AlunoWidget> alunos = List<AlunoWidget>();

final List<String> _tempos = [
  '1º Tempo',
  '2º Tempo',
  '3º Tempo',
  '4º Tempo',
  '5º Tempo',
  '6º Tempo',
].toList();

class AbaFrequencia extends StatelessWidget {
  const AbaFrequencia({this.abaFrequencia});

  final AbaFrequencia abaFrequencia;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _linhaDataTempo(),
        Divider(),
        _linhaSalvar(),
        Divider(),
        ListaPresenca(),
      ],
    );
  }
}

Widget _linhaDataTempo() {
  return Container(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: DatePickerWidget(),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5.0),
                child: DropdownWidget(_tempos),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _linhaSalvar() {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Icon(
                            Icons.brightness_1,
                            color: Colors.green[500],
                          ),
                          Text('Presença',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Icon(
                            Icons.brightness_1,
                            color: Colors.red[500],
                          ),
                          Text('Presença',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BotaoWidget(
                    label: 'Salvar',
                    onPressed: () {
                      debugPrint(alunos.toString());
                      AlunoBloc.writeJson(alunos);
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      ]);
}

class ListaPresenca extends StatefulWidget {
  @override
  ListaPresencaState createState() => ListaPresencaState();
}

class ListaPresencaState extends State<ListaPresenca> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
      child: FutureBuilder<List<Aluno>>(
          future: AlunoBloc.readJson(),
          builder: (BuildContext context, AsyncSnapshot<List<Aluno>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("nada a retornar");

              case ConnectionState.waiting:
                return Text("Waiting");

              default:
                if (snapshot.hasError)
                  return Text("erro!!:${snapshot.error}");
                else {
                  if (!snapshot.hasData)
                    return Container(
                      child: Text("Sem dados!"),
                    );

                  return Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(6.0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            AlunoWidget alunoWidget =
                                AlunoWidget(snapshot.data[index]);

                            alunos.add(alunoWidget);

                            return alunoWidget;
                          }));
                }
            }
          }),
    ));
  }
}

class AlunoWidget extends StatefulWidget {
  final Aluno aluno;

  AlunoWidget(this.aluno);

  @override
  _AlunoWidgetState createState() => _AlunoWidgetState(this.aluno);
}

class _AlunoWidgetState extends State<AlunoWidget> {
  _AlunoWidgetState(Aluno aluno);

  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallerFont = const TextStyle(fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Text(
            widget.aluno.numDiario.toString(),
            style: _biggerFont,
          ),
          title: Text(
            widget.aluno.nomeAluno,
            style: _biggerFont,
          ),
          subtitle: Text(
            widget.aluno.codAluno,
            style: _smallerFont,
          ),
          trailing: Icon(
            Icons.brightness_1,
            color: widget.aluno.isPresent ? Colors.green[500] : Colors.red[500],
          ),
          onTap: () {
            setState(() {
              widget.aluno.isPresent = !widget.aluno.isPresent;
            });
          },
        ),
        Divider(),
      ],
    );
  }
}
