// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'dart:io';

import 'package:dd_movel/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  print(directory.path);
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;

  print(path.toString());
  return new File('$path/alunos.json');
}


void main() {
  testWidgets('Carregar alunos', (WidgetTester tester) async {
    await tester.pumpWidget(new DiarioDigitalMobile());
  });
}
