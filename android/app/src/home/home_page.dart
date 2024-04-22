import 'package:flutter/material.dart';

import '../widgets/custom_stack.dart';
import '../widgets/custom_text.dart';

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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CustomText('Nombre de la película', style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 20),
                const CustomStack(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
