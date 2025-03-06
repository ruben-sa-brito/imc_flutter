import 'package:flutter/material.dart';
import 'package:imc_flutter/repositories/json_loader.dart';

void showModalSaveName(BuildContext context, double imc, String state) {
  TextEditingController controllerNome = TextEditingController();
  showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              height: 200,
                              child: Column(
                                children: [
                                  TextField(
                                    controller: controllerNome,
                                    decoration: const InputDecoration(
                                                  labelText: 'Digite seu Nome',
                                                  border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          writeJson(controllerNome.text, imc, state);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Salvar"),
                                      ),
                                      SizedBox(width: 5,),
                                      ElevatedButton(
                                        onPressed: () => {
                                          Navigator.pop(context)
                                        },
                                        child: Text("Cancelar"),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        );
}