import 'dart:math';

import 'package:flutter/material.dart';

class CalculoImcWidget extends StatefulWidget {
  @override
  _CalculoImcWidgetState createState() => _CalculoImcWidgetState();
}

class _CalculoImcWidgetState extends State<CalculoImcWidget> {
  int _radioValue = 0;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController alturacontroller = TextEditingController();
  TextEditingController pesocontroller = TextEditingController();
  String _resultadoimc;

  void _calcularimc() {
    double altura = double.parse(alturacontroller.text) / 100.0;
    double peso = double.parse(pesocontroller.text);
    double imc = peso / pow(altura, 2);

    setState(() {
      _resultadoimc = imc.toStringAsFixed(2) + "\n\n" + getClassificacao(imc);
    });
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  void initState() {
    setState(() {
      _radioValue = 1;
    });
    super.initState();
  }

  String getClassificacao(num imc) {
    String strClassificacao = "";
    if (_radioValue == 1) {
      if (imc < 20)
        strClassificacao = "Abaixo do peso";
      else if (imc < 26.4)
        strClassificacao = "Peso ideal";
      else if (imc < 27.8)
        strClassificacao = "Levemente acima do peso";
      else if (imc < 31.1)
        strClassificacao = "Acima do Peso";
      else if (imc < 31.1) strClassificacao = "Obesidade";
    } else {
      if (imc < 18.5) {
        strClassificacao = "Abaixo do peso";
      } else if (imc < 24.9) {
        strClassificacao = "Peso Ideal";
      } else if (imc < 29.9) {
        strClassificacao = "Levemente acima do peso";
      } else if (imc < 34.9) {
        strClassificacao = "Obesidade grau I";
      } else if (imc < 39.9) {
        strClassificacao = "Obesidade grau II";
      } else {
        strClassificacao = "Obesidade grau III";
      }
    }

    return strClassificacao;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              // ALTURA
              child: TextFormField(
                keyboardType: TextInputType.number, // teclado
                controller: alturacontroller,
                validator: (value) {
                  return value.isEmpty
                      ? "Informe a altura"
                      : null; // validaçãoa
                },
                decoration: InputDecoration(
                  labelText: "Altura em cm",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              //PESO
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: pesocontroller,
                validator: (value) {
                  return value.isEmpty ? "Informe o peso" : null;
                },
                decoration: InputDecoration(
                  labelText: "Peso em Kg",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                _resultadoimc == null ? "" : "IMC: $_resultadoimc",
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _calcularimc();
                  }
                },
                child: Text('Calcular'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
