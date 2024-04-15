import 'package:flutter/material.dart';

import '../widgets/custom_stack.dart';
import '../widgets/custom_text.dart';
import '../widgets/rating_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomText('Reseña de peclícula'),
            CustomText('Nombre de la película', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            const RatingDisplay(rating: 4.5),
            const SizedBox(height: 20),
            const CustomStack(),
          ],
        ),
      ),
    );
  }
}
