import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> readJson() async {
  Directory dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/local_data.json');
  if (await file.exists()) {
    String fileContents = await file.readAsString();
    return fileContents;
  }
  final jsonContent = jsonEncode({"imcs": []});
  await file.writeAsString(jsonContent);
  return jsonContent;
} 

void writeJson(String name, double imc, String state) async {
  Directory dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/local_data.json');
  if (await file.exists()) {
    String jsonContent = await file.readAsString();
    Map<String, dynamic> jsonData = jsonDecode(jsonContent);
    jsonData["imcs"].add({"name":name, "imc":imc, "state":state});
    final jsonContentE = jsonEncode(jsonData);
    await file.writeAsString(jsonContentE);
    return;
  }
  final jsonContent = jsonEncode({"imcs": []});
  await file.writeAsString(jsonContent);
  String jsonContentE = await file.readAsString();
  Map<String, dynamic> jsonData = jsonDecode(jsonContentE);
  jsonData["imcs"].add({"name":name, "imc":imc, "state":state});
  final jsonContentEE = jsonEncode(jsonData);
  await file.writeAsString(jsonContentEE);
  return;
}

Future<int> deleteJson(int index) async {
  Directory dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/local_data.json');
  String fileContents = await file.readAsString();
  Map<String, dynamic> jsonData = jsonDecode(fileContents);
  jsonData["imcs"].removeAt(index);
  final jsonContentEE = jsonEncode(jsonData);
  await file.writeAsString(jsonContentEE);
  return 1;
} 