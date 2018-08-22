import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:dd_movel/model/aluno.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

enum AlunosType {
  alunos,
}

class AlunoBloc {
  final _alunosSubject = BehaviorSubject<UnmodifiableListView<Aluno>>();

  var _alunos = <Aluno>[];

  final _alunosTypeController = StreamController<AlunosType>();

  Sink<AlunosType> get alunosType => _alunosTypeController.sink;

  AlunoBloc() {
    _getAlunosAndUpdate(_topIds);

    _alunosTypeController.stream.listen((alunosType) {
      if (alunosType == AlunosType.alunos) {
        _getAlunosAndUpdate(_newIds);
      } else {
        _getAlunosAndUpdate(_topIds);
      }
    });
  }

  _getAlunosAndUpdate(List<int> ids) {
    _updateAlunos(ids).then((_) {
      _alunosSubject.add(UnmodifiableListView(_alunos));
    });
  }

  Stream<UnmodifiableListView<Aluno>> get alunos => _alunosSubject.stream;

  Future<Aluno> _getAluno(int id) async {
    return null;
  }

  Future<Null> _updateAlunos(List<int> alunoIds) async {
    _alunos = await Future.wait(alunoIds.map((id) => _getAluno(id)));
  }
}

Future<String> get _localPath async {
  return (await getApplicationDocumentsDirectory()).path;
}

Future<File> get _localFile async {
  final path = await _localPath;

  return new File('$path/alunos.json');
}

Future<List<Aluno>> readJson() async {
  try {
    final File file = await _localFile;

    if (!file.existsSync()) {
      file.writeAsStringSync(await rootBundle.loadString('./test_resources/alunos.json'));
    }


    return null;
  } catch (e) {
    debugPrint("Erro de leitura de arquivo: ${e.toString()}");

    return null;
  }
}
