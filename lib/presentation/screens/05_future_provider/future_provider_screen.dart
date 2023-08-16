import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonName = ref.watch(pokemonNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-1',
            child: const Icon(Icons.refresh),
            onPressed: () {
              //va a cambiar el estado y esto va a hacer que se haga de nuevo la peticio http
              ref.read(pokemonIdProvider.notifier).nextPokemon();
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.minimize_outlined),
            onPressed: () {
              //va a cambiar el estado y esto va a hacer que se haga de nuevo la peticio http
              ref.read(pokemonIdProvider.notifier).prevPokemon();
            },
          ),
        ],
      ),
    );
  }
}
