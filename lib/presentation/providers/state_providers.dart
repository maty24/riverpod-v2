import 'package:riverpod_annotation/riverpod_annotation.dart';

//esto es necesario haer
part 'state_providers.g.dart';

//esto por defecto se va a destruir si no se va de la pagina
@riverpod
class Counter extends _$Counter {
  @override
  int build() => 5;

  void increseByOne() {
    state++;
  }
}

//en este caso cuando se sale de la pagina no se va a destruir el estado ya que se va a seguir ocupando activamente fuera la pagina
@riverpod
class DarkMode extends _$DarkMode {
  @override
  //funcion que retorna
  bool build() => false;

  void toggleDarkMode() {
    state = !state;
  }
}

//le pongo Riverpod con mayuscula y el keepalive para que el statado no se destruya cuando me salgo de la pantalla donde lo estoy usando
@Riverpod(keepAlive: true)
class Username extends _$Username {
  @override
  String build() => 'Matias G';

  void changeName(String name) {
    state = name;
  }
}
