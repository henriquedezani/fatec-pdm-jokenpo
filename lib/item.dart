import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String texto;
  final IconData icone;
  final bool selected;

  Item(this.texto, this.icone, {this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            this.icone,
            size: 42,
            color: this.selected ? Colors.blue : Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            this.texto,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
