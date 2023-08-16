import 'package:riverpod_annotation/riverpod_annotation.dart';

//archivo autogenereado
part 'hello_world_provider.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  //el ref obtener la refeencia de todos los priovder de riverpod que se crearon
  return 'Hello world';
}
