import 'package:flutter/material.dart';
import 'package:imc_flutter/pages_drawer/drawer.dart';
import 'package:imc_flutter/repositories/json_loader.dart';
import 'package:imc_flutter/utils/state_colors.dart';
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < (jsonData?["imcs"].length ?? 0); i++)
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: Icon(Icons.person, size: 40, color: Colors.blue),
                        title: Text(jsonData?["imcs"][i]["name"]),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alinha os textos à esquerda
                          children: [
                            Text("${jsonData?["imcs"][i]["imc"]}"),
                            Text(
                              jsonData?["imcs"][i]["state"], // Adicionando um status abaixo do IMC
                              style: TextStyle(color: setColor(jsonData?["imcs"][i]["state"]), fontWeight: FontWeight.bold),
                            )                        
                          ]
                        ),
                        trailing: IconButton(
                                    onPressed: () async {
                                      await deleteJson(i);
                                      _loadData();
                                    },
                                    icon: Icon(Icons.delete), // Ícone do botão
                                    color: const Color.fromARGB(255, 196, 69, 52), // Cor do ícone
                                  )
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}