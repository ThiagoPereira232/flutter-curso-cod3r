import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  const Resposta(this.text, this.onSelecao, {super.key});

  final String text;
  final void Function() onSelecao;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelecao,
        
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        child: Text(text),
      ),
    );
  }
}
