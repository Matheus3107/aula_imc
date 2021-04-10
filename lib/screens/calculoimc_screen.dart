import 'package:aula_imc/widgets/calculoimc_widget.dart';
import 'package:flutter/material.dart';

class CalculoImcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calcular IMC por Gênero.",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: CalculoImcWidget(),
    );
  }
}
