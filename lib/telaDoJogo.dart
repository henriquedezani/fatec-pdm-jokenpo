import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/item.dart';

class TelaDoJogo extends StatefulWidget {
  const TelaDoJogo({Key? key}) : super(key: key);

  @override
  _TelaDoJogoState createState() => _TelaDoJogoState();
}

class _TelaDoJogoState extends State<TelaDoJogo> {
  String? itemSelecionado;
  String? computadorSelecionou;

  void _onItemClick(String item) {
    final random = Random();

    var opcoes = ["pedra", "papel", "tesoura"];

    setState(() {
      itemSelecionado = item;
      computadorSelecionou = opcoes[random.nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Computador"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Item(
                  "Pedra",
                  Icons.favorite,
                  selected: computadorSelecionou == "pedra",
                ),
                Item(
                  "Papel",
                  Icons.battery_alert,
                  selected: computadorSelecionou == "papel",
                ),
                Item(
                  "Tesoura",
                  Icons.wifi,
                  selected: computadorSelecionou == "tesoura",
                ),
              ],
            ),
            Text("Jogador"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Item(
                    "Pedra",
                    Icons.favorite,
                    selected: itemSelecionado == "pedra",
                  ),
                  onTap: () => _onItemClick("pedra"),
                ),
                GestureDetector(
                  child: Item(
                    "Papel",
                    Icons.battery_alert,
                    selected: itemSelecionado == "papel",
                  ),
                  onTap: () => _onItemClick("papel"),
                ),
                GestureDetector(
                  child: Item(
                    "Tesoura",
                    Icons.wifi,
                    selected: itemSelecionado == "tesoura",
                  ),
                  onTap: () => _onItemClick("tesoura"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
