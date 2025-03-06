import 'package:flutter/material.dart';
import 'package:imc_flutter/pages_drawer/drawer.dart';
import 'package:imc_flutter/repositories/json_loader.dart';
import 'dart:convert';

class ImcList extends StatefulWidget {
  const ImcList ({super.key});

  @override
  State<ImcList> createState() => _ImcListState();
}

class _ImcListState extends State<ImcList> {
  Map<String, dynamic>? jsonData; 
  @override
  void initState() {
    super.initState();
    _loadData();
    
  }

  Future<void> _loadData() async { 
    String jsonDataAux = await readJson();
    setState(() {
      jsonData = jsonDecode(jsonDataAux);
    });
  }

  // Future<String> colectJson() async {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: TheDrawer(),
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Meus Imcs"),
      ),
      body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  for (var imc in jsonData?["imcs"] ?? [])
                  Row(
                    children: [Text("${imc['name']}"), Text("${imc['imc']}"), Text("${imc['state']}")],
                  )
                ],
              ),
            ),
    );
  }
}