import 'package:flutter/cupertino.dart';

class HomeController extends ValueNotifier<String> {
  HomeController() : super('Informe seus dados');

  void calcular({required double peso, required double altura}) {
    altura = altura / 100;
    double imc = peso / (altura * altura);

    if (imc <= 18.5) {
      value = "Abaixo do peso (IMC = ${imc.toStringAsPrecision(3)})";
    } else if (imc <= 24.9) {
      value = "Peso ideal (IMC = ${imc.toStringAsPrecision(3)})";
    } else if (imc <= 29.9) {
      value = "Sobrepeso (IMC = ${imc.toStringAsPrecision(3)})";
    } else if (imc <= 34.9) {
      value = "Obesidade (IMC = ${imc.toStringAsPrecision(3)})";
    } else if (imc <= 39.9) {
      value = "Obesidade II (IMC = ${imc.toStringAsPrecision(3)})";
    } else if (imc >= 40) {
      value = "Obesidade Mórbida (IMC = ${imc.toStringAsPrecision(3)})";
    }
  }
}
