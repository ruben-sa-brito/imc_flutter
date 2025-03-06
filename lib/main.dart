import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_flutter/utils/imc_calc.dart';
import 'package:imc_flutter/pages_drawer/drawer.dart';
import 'package:imc_flutter/modals/save_imc.dart';
import 'package:imc_flutter/repositories/json_loader.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAltura = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerAltura.addListener(_formatarAltura);
  }

  void _formatarAltura() {
    String temp = _controllerAltura.text.replaceAll('.', '');

    if (temp.isNotEmpty && temp.length > 2) {
      setState(() {
        _controllerAltura.value = TextEditingValue(
          text: '${temp.substring(0, temp.length - 2)}.${temp.substring(temp.length - 2)}',
          selection: TextSelection.collapsed(offset: _controllerAltura.text.length),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawer: TheDrawer(),
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [TextField(
                      controller: _controllerPeso,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                                    labelText: 'Digite seu peso',
                                    border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextField(
                      controller: _controllerAltura,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                                    labelText: 'Digite sua altura',
                                    border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Map<double, String> imc =  calcularImc(double.parse(_controllerPeso.text), double.parse(_controllerAltura.text));
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              height: 200,
                              child: Column(
                                children: [
                                  Text("IMC: $imc"),
                                  SizedBox(height: 20,),
                                  Text("Deseja salvar seu IMC?"),
                                  SizedBox(height: 10,),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          showModalSaveName(context, imc.entries.first.key, imc.entries.first.value);
                                        },
                                        child: Text("Sim"),
                                      ),
                                      SizedBox(width: 5,),
                                      ElevatedButton(
                                        onPressed: () => {
                                          Navigator.pop(context)
                                        },
                                        child: Text("Fechar"),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      },
                      child: const Text('Calcular'),
                    ),
            SizedBox(height: 20,),
            ElevatedButton(
                      onPressed: () async {
                        var datajson = await readJson();
                        print(datajson);
                      },
                      child: Text("Show Json"),
            ),
                        
            ],
        )
      ), 
    );
  }
}
