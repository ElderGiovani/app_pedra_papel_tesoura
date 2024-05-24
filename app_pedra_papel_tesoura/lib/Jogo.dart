import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
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
          const Padding(padding: EdgeInsets.only(top: 32, bottom: 16)),
          const Text(
            'Escolha do APP',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset('assets/images/papel.png'),
          const Padding(padding: EdgeInsets.only(top: 32, bottom: 16)),
          const Text(
            'Escolha uma opção abaixo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/papel.png', height: 110),
              Image.asset('assets/images/pedra.png', height: 110),
              Image.asset('assets/images/tesoura.png', height: 110),
            ],
          )
        ],
      ),
    );
  }
}
