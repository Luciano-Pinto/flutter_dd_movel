// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<Aluno> _$alunoSerializer = new _$AlunoSerializer();

class _$AlunoSerializer implements StructuredSerializer<Aluno> {
  @override
  final Iterable<Type> types = const [Aluno, _$Aluno];
  @override
  final String wireName = 'Aluno';

  @override
  Iterable serialize(Serializers serializers, Aluno object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'numDiario',
      serializers.serialize(object.numDiario,
          specifiedType: const FullType(int)),
      'nomeAluno',
      serializers.serialize(object.nomeAluno,
          specifiedType: const FullType(String)),
      'codAluno',
      serializers.serialize(object.codAluno,
          specifiedType: const FullType(String)),
      'isPresent',
      serializers.serialize(object.isPresent,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Aluno deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new AlunoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'numDiario':
          result.numDiario = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nomeAluno':
          result.nomeAluno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codAluno':
          result.codAluno = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isPresent':
          result.isPresent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Aluno extends Aluno {
  @override
  final int numDiario;
  @override
  final String nomeAluno;
  @override
  final String codAluno;
  @override
  final bool isPresent;

  factory _$Aluno([void updates(AlunoBuilder b)]) =>
      (new AlunoBuilder()..update(updates)).build();

  _$Aluno._({this.numDiario, this.nomeAluno, this.codAluno, this.isPresent})
      : super._() {
    if (numDiario == null)
      throw new BuiltValueNullFieldError('Aluno', 'numDiario');
    if (nomeAluno == null)
      throw new BuiltValueNullFieldError('Aluno', 'nomeAluno');
    if (codAluno == null)
      throw new BuiltValueNullFieldError('Aluno', 'codAluno');
    if (isPresent == null)
      throw new BuiltValueNullFieldError('Aluno', 'isPresent');
  }

  @override
  Aluno rebuild(void updates(AlunoBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AlunoBuilder toBuilder() => new AlunoBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Aluno) return false;
    return numDiario == other.numDiario &&
        nomeAluno == other.nomeAluno &&
        codAluno == other.codAluno &&
        isPresent == other.isPresent;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, numDiario.hashCode), nomeAluno.hashCode),
            codAluno.hashCode),
        isPresent.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Aluno')
          ..add('numDiario', numDiario)
          ..add('nomeAluno', nomeAluno)
          ..add('codAluno', codAluno)
          ..add('isPresent', isPresent))
        .toString();
  }
}

class AlunoBuilder implements Builder<Aluno, AlunoBuilder> {
  _$Aluno _$v;

  int _numDiario;
  int get numDiario => _$this._numDiario;
  set numDiario(int numDiario) => _$this._numDiario = numDiario;

  String _nomeAluno;
  String get nomeAluno => _$this._nomeAluno;
  set nomeAluno(String nomeAluno) => _$this._nomeAluno = nomeAluno;

  String _codAluno;
  String get codAluno => _$this._codAluno;
  set codAluno(String codAluno) => _$this._codAluno = codAluno;

  bool _isPresent;
  bool get isPresent => _$this._isPresent;
  set isPresent(bool isPresent) => _$this._isPresent = isPresent;

  AlunoBuilder();

  AlunoBuilder get _$this {
    if (_$v != null) {
      _numDiario = _$v.numDiario;
      _nomeAluno = _$v.nomeAluno;
      _codAluno = _$v.codAluno;
      _isPresent = _$v.isPresent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Aluno other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Aluno;
  }

  @override
  void update(void updates(AlunoBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Aluno build() {
    final _$result = _$v ??
        new _$Aluno._(
            numDiario: numDiario,
            nomeAluno: nomeAluno,
            codAluno: codAluno,
            isPresent: isPresent);
    replace(_$result);
    return _$result;
  }
}
