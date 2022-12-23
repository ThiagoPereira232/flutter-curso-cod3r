import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(this.pontuacao, this.reiniciarQuestionario, {super.key});

  String get fraseResultado {
    if (pontuacao == 0) {
      return 'Parabéns você errou todas!';
    } else if (pontuacao == 10) {
      return 'Impressionante, você acertou todas as perguntas!';
    } else {
      return 'Parabéns, você acertou $pontuacao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              fraseResultado,
              style: const TextStyle(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: reiniciarQuestionario,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 18,
              )
            ),
          )
        ],
      ),
    );
  }
}
