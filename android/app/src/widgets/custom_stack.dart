import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: Colors.green,
        ),
        const Text(
          'Imágen',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
