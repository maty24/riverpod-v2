import 'package:flutter/material.dart';


class FamilyFutureScreen extends StatelessWidget {
  const FamilyFutureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Future Provider'),
      ),
      body: const Center(
        child: Text('Fernando Herrera'),
      ),
            floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon(Icons.refresh),
            onPressed: () {

            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.minimize_outlined),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
}