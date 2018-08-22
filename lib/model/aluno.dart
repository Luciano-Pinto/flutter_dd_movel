import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'aluno.g.dart';

abstract class Aluno implements Built<Aluno, AlunoBuilder> {
  static Serializer<Aluno> get serializer => _$alunoSerializer;

  int get numDiario;
  String get nomeAluno;
  String get codAluno;
  bool get isPresent;


  Aluno._();
  factory Aluno([updates(AlunoBuilder b)]) = _$Aluno;
}


Aluno parseAluno(String jsonAluno) {
  final parsed = json.decode(jsonAluno);

  return standardSerializers.deserializeWith(Aluno.serializer, parsed);
}

/*class Aluno {
  final int numDiario;
  final String nomeAluno;
  final String codAluno;
  bool isPresent = true;

  Aluno(
    this.numDiario,
    this.nomeAluno,
    this.codAluno,
    this.isPresent,
  );

  Aluno.fromJson(Map<String, dynamic> json)
      : numDiario = json['numDiario'],
        nomeAluno = json['nomeAluno'],
        codAluno = json['codAluno'],
        isPresent = json['isPresent'];

  Map<String, dynamic> toJson() => {
    'numDiario': numDiario,
    'nomeAluno': nomeAluno,
    'codAluno': codAluno,
    'isPresent': isPresent,
  };
}*/
