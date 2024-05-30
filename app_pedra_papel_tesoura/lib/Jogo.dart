import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = const AssetImage('assets/images/padrao.png');
  var _mensagem = 'Escolha uma opção abaixo';

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    if (kDebugMode) {
      print("Escolha do APP :$escolhaApp");
    }
    if (kDebugMode) {
      print("Escolha do Usuario :$escolhaUsuario");
    }
    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra ":
        setState(() {
          _imagemApp = const AssetImage("assets/images/pedra.png");
        });

        break;
      case "papel ":
        setState(() {
          _imagemApp = const AssetImage("assets/images/papel.png");
        });

        break;
      case "tesoura ":
        setState(() {
          _imagemApp = const AssetImage("assets/images/tesoura.png");
        });

        break;
    }

    // Validação do ganhador

    // Usuario ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _mensagem = "Parabéns !!! Você ganhou";
      });
      // APP Ganhador
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _mensagem = "Você Perdeu";
      });
    } else {
      setState(() {
        _mensagem = "Empatamos ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagens
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Escolha do APP',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset('assets/images/pedra.png', height: 110),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset('assets/images/papel.png', height: 110),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset('assets/images/tesoura.png', height: 110),
              ),
              /*
              Image.asset('assets/images/pedra.png', height: 110),
              Image.asset('assets/images/papel.png', height: 110),
              Image.asset('assets/images/tesoura.png', height: 110),
              */
            ],
          )
        ],
      ),
    );
  }
}
