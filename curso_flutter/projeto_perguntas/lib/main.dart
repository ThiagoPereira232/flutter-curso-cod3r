import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 10},
        {'texto': 'Roxo', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cobra', 'pontuacao': 10},
        {'texto': 'Elefante', 'pontuacao': 10},
        {'texto': 'Girafa', 'pontuacao': 10},
        {'texto': 'Hipopótamo', 'pontuacao': 1},
      ]
    },
    {
      'pergunta': 'Você é?',
      'respostas': [
        {'texto': 'Criança', 'pontuacao': 10},
        {'texto': 'Adolescente', 'pontuacao': 10},
        {'texto': 'Adulto', 'pontuacao': 10},
        {'texto': 'Idoso', 'pontuacao': 1},
      ]
    },
    {
      'pergunta': 'Você mora em?',
      'respostas': [
        {'texto': 'Casa', 'pontuacao': 10},
        {'texto': 'Apartamento', 'pontuacao': 10},
        {'texto': 'Sobradinho', 'pontuacao': 10},
        {'texto': 'Sobradão', 'pontuacao': 10},
        {'texto': 'Condominho', 'pontuacao': 10},
        {'texto': 'Mansão', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    // for (String textResposta in respostas) {
    //   widgets.add(Resposta(textResposta, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
