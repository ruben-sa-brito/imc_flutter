Map<double, String> calcularImc(peso, altura){
  double imc = peso / (altura * altura);
  imc = (imc * 100).roundToDouble() / 100;

  if (imc < 16){
    return {imc:"Magreza grave"};
  } else if (imc < 17){
    return {imc:"Magreza moderada"};
  } else if (imc < 18.5){
    return {imc:"Magreza leve"};
  } else if (imc < 25){
    return {imc:"Saudável"};
  } else if (imc < 30){
    return {imc:"Sobrepeso"};
  } else if (imc < 35){
    return {imc:"Obesidade Grau I"};
  } else if (imc < 40){
    return {imc:"Obesidade Grau II (severa)"};
  } else {
    return {imc:"Obesidade Grau III (mórbida)"};
  }
}