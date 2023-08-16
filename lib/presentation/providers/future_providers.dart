import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(PokemonNameRef ref) async {
  //para usar este provider es necesario que este en keepalive para el correcto funcionamiento, asi me aseguro que siempre va a ver un valor y no se rompa la app
  final pokemonId =
      ref.watch(pokemonIdProvider); //va a estar pendiente de los cambios

  //peticion http
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);

  /* funcion que hace que cuando se cierra el provider puede hacer una accion
  ref.onDispose(() {

  });
 */
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() => 1;

  //para cambiar el estado de este provider
  void nextPokemon() {
    state++;
  }

  void prevPokemon() {
    //si es el state es mayor a 1 se puede hacer como una resta
    if (state > 1) {
      state--;
    }
  }
}
