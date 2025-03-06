import 'package:flutter/material.dart';


Color setColor(String status){

  Map<String, Color> stateColors= {
    "Magreza grave": const Color.fromARGB(255, 183, 83, 58),
    "Magreza moderada": Color.fromARGB(255, 201, 137, 64),
    "Magreza leve": Color.fromARGB(255, 201, 187, 64),
    "Saudável": Color.fromARGB(255, 27, 146, 43),
    "Sobrepeso": Color.fromARGB(255, 192, 201, 64),
    "Obesidade Grau I": Color.fromARGB(255, 172, 133, 60),
    "Obesidade Grau II (severa)": Color.fromARGB(255, 168, 81, 46),
    "Obesidade Grau III (mórbida)": Color.fromARGB(255, 206, 36, 13),
  
  };

  return stateColors[status]!;
}
