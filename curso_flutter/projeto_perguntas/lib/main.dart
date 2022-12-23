import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'pergunta': 'Quanto é 1 + 1?',
      'respostas': [
        {'texto': '0', 'pontuacao': 0},
        {'texto': '1', 'pontuacao': 0},
        {'texto': '2', 'pontuacao': 1},
        {'texto': '11', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'Qual é o coletivo de cães?',
      'respostas': [
        {'texto': 'Matilha', 'pontuacao': 1},
        {'texto': 'Rebanho', 'pontuacao': 0},
        {'texto': 'Alcateia', 'pontuacao': 0},
        {'texto': 'Manada', 'pontuacao': 0},
      ]
    },
    {
      'pergunta':
          'Seguindo a sequência do baralho, qual carta vem depois do 10?',
      'respostas': [
        {'texto': 'Rei', 'pontuacao': 0},
        {'texto': 'Valete', 'pontuacao': 1},
        {'texto': 'Nove', 'pontuacao': 0},
        {'texto': 'Dama', 'pontuacao': 0},
        {'texto': 'Ás', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'Quingentésimo corresponde a qual número?',
      'respostas': [
        {'texto': '5', 'pontuacao': 0},
        {'texto': '50', 'pontuacao': 0},
        {'texto': '500', 'pontuacao': 1},
        {'texto': '5000', 'pontuacao': 0},
        {'texto': '50000', 'pontuacao': 0},
        {'texto': '500000', 'pontuacao': 0},
      ],
    },
    {
      'pergunta': 'Que país da Europa é conhecido como países baixos?',
      'respostas': [
        {'texto': 'Holanda', 'pontuacao': 1},
        {'texto': 'Áustria', 'pontuacao': 0},
        {'texto': 'Bélgica', 'pontuacao': 0},
        {'texto': 'Huncgria', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'O que é Via Láctea?',
      'respostas': [
        {'texto': 'Marca de leite', 'pontuacao': 0},
        {'texto': 'Civilização antiga', 'pontuacao': 0},
        {'texto': 'Carro', 'pontuacao': 0},
        {'texto': 'Galáxia', 'pontuacao': 1},
      ]
    },
    {
      'pergunta': 'Qual desses paises não é da América do Sul?',
      'respostas': [
        {'texto': 'Equador', 'pontuacao': 0},
        {'texto': 'Chile', 'pontuacao': 0},
        {'texto': 'Suriname', 'pontuacao': 0},
        {'texto': 'Panamá', 'pontuacao': 1},
        {'texto': 'Guiana Francesa', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'Qual animal é conhecido como papa formiga?',
      'respostas': [
        {'texto': 'Tamanduá', 'pontuacao': 1},
        {'texto': 'Tatu', 'pontuacao': 0},
        {'texto': 'Gamba', 'pontuacao': 0},
        {'texto': 'Avestruz', 'pontuacao': 0},
      ]
    },
    {
      'pergunta': 'Qual desses aparelhos domésticos consome mais energia?',
      'respostas': [
        {'texto': 'Rádio', 'pontuacao': 0},
        {'texto': 'Liquidificador', 'pontuacao': 0},
        {'texto': 'Batedeira', 'pontuacao': 0},
        {'texto': 'Chuveiro', 'pontuacao': 1},
      ]
    },
    {
      'pergunta':
          'Qual destes monumentos não é uma das 7 maravilhas do mundo moderno?',
      'respostas': [
        {'texto': 'Coliseu de Roma', 'pontuacao': 0},
        {'texto': 'Cristo Redentor', 'pontuacao': 0},
        {'texto': 'Muralha da China', 'pontuacao': 0},
        {'texto': 'Farol de Alexandria', 'pontuacao': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
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
      debugShowCheckedModeBanner: false,

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
