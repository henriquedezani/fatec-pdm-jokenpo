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

  void _onItemClick(String item, BuildContext context) {
    final random = Random();

    var opcoes = ["pedra", "papel", "tesoura"];

    String? ganhou;

    computadorSelecionou = opcoes[random.nextInt(3)];

    if (item == 'pedra' && computadorSelecionou == 'papel')
      ganhou = 'computador';
    if (item == 'papel' && computadorSelecionou == 'tesoura')
      ganhou = 'computador';
    if (item == 'tesoura' && computadorSelecionou == 'pedra')
      ganhou = 'computador';
    if (item == 'papel' && computadorSelecionou == 'pedra') ganhou = 'jogador';
    if (item == 'tesoura' && computadorSelecionou == 'papel')
      ganhou = 'jogador';
    if (item == 'pedra' && computadorSelecionou == 'tesoura')
      ganhou = 'jogador';
    if (item == computadorSelecionou) ganhou = 'empate';

    var alert = AlertDialog(
      title: Text("Vencedor"),
      content: Text(ganhou!),
      actions: [
        ElevatedButton(
          child: Text("Ok"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );

    showDialog(
        context: context, builder: (_) => alert, barrierDismissible: false);

    setState(() {
      itemSelecionado = item;
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
                  onTap: () => _onItemClick("pedra", context),
                ),
                GestureDetector(
                  child: Item(
                    "Papel",
                    Icons.battery_alert,
                    selected: itemSelecionado == "papel",
                  ),
                  onTap: () => _onItemClick("papel", context),
                ),
                GestureDetector(
                  child: Item(
                    "Tesoura",
                    Icons.wifi,
                    selected: itemSelecionado == "tesoura",
                  ),
                  onTap: () => _onItemClick("tesoura", context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
