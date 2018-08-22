import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dd_movel/abas/frequencia/aba_frequencia.dart';
import 'package:dd_movel/model/aluno.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class JsonAluno {
  static Map<String, dynamic> alunosJson;
  static List jsonData;
  static List<Aluno> alunos;

  static Future<String> get _localPath async {
    return (await getApplicationDocumentsDirectory()).path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;

    return new File('$path/alunos.json');
  }

  static void writeJson(List<AlunoWidget> alunos) async {
    final file = await _localFile;
    String jsonString;

//    alunosJson = json.decode(file.readAsStringSync());

    alunos.forEach((AlunoWidget widget) {

      alunosJson.update('isPresent', widget.aluno.isPresent as dynamic);
    });

    debugPrint('writeJson: ${alunosJson.values.toString()}');
    jsonString = json.encode(alunosJson);

    file.writeAsStringSync(jsonString);

    /*for (alunosJson.) {
      file.writeAsString(json.encode(alunosJson));
    }*/
  }

  static Future<List<Aluno>> readJson() async {
    try {
      final File file = await _localFile;

      alunos = new List<Aluno>();

      if (!file.existsSync()) {
        file.writeAsStringSync(
            await rootBundle.loadString('./test_resources/alunos.json'));
      }

      jsonData = json.decode(file.readAsStringSync());
      alunosJson = new Map<String, dynamic>();

      jsonData.forEach((value) {
//        alunos.add(new Aluno.fromJson(value));
        alunosJson.addAll(value);
        debugPrint('readJson:${alunosJson.values.toString()}');
      });

     /* for (*//*Map<String, dynamic>*//* var value in jsonData) {
        alunos.add(new Aluno.fromJson(value));
        alunosJson.addAll(value);

      }*/



      return alunos;

    } catch (e) {

      debugPrint("Erro de leitura de arquivo: ${e.toString()}");

      return null;
    }
  }
}
