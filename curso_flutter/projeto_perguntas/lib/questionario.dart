import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;
  const Questionario({
    super.key,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    required this.perguntas,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Column(
        children: [
          Questao(perguntas[perguntaSelecionada]['pergunta'] as String),
          ...respostas.map((resp) {
            return Resposta(
              resp['texto'] as String,
              () => quandoResponder(int.parse(resp['pontuacao'].toString())),
            );
          }).toList(),
        ],
      ),
    );
  }
}
