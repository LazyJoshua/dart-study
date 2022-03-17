import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

void main(List<String> args) async {
  print('before parse json file');
  // Read some data.
  final jsonData = await _parseInBackground();

  // Use that data
  print('number of JSON keys = ${jsonData.length}');
}

Future _readAndParseJson(SendPort p) async {
  final fileData = await File(
          '/Users/zhouxinghua/Development/workspace/dart/dart_study/function/photos.json')
      .readAsString();
  print('read file finished');
  final jsonData = jsonDecode(fileData);
  print(jsonData.runtimeType);
  print('json decode finished');
  Isolate.exit(p, jsonData);
}

// Spawns an isolate and waits for the first message
Future<List<dynamic>> _parseInBackground() async {
  final p = ReceivePort();
  await Isolate.spawn(_readAndParseJson, p.sendPort);
  return await p.first;
}
