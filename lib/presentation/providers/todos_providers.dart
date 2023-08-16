import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

//debe ser el mismo nombre que le puse al archivo
part 'todos_providers.g.dart';

const uuid = Uuid();

enum FilterType { all, completed, pending }

@riverpod
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() => FilterType.all;

  void changeCurrentFilter(FilterType newFilter) {
    state = newFilter;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() => [
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now()),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now()),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now()),
      ];

  void toggleTodo(String id) {
    //
    state = state.map((todo) {
      if (todo.id == id) {
        todo = todo.copyWith(
          completedAt: todo.done ? null : DateTime.now(),
        );
      }
      return todo;
    }).toList();
  }

  void createTodo(String description) {
    state = [
      ...state,
      Todo(id: uuid.v4(), description: description, completedAt: null),
    ];
  }
}

///  filteredTodos // SOLO LECTURA
@riverpod
List<Todo> filteredTodos(FilteredTodosRef ref) {
  //tipo de estados
  final currentFilter = ref.watch(todoCurrentFilterProvider);
  //lista de todos
  final todos = ref.watch(todosProvider);

  //depende el tipo de estado se hace lo siguiente
  switch (currentFilter) {
    case FilterType.all:
      return todos;

    case FilterType.completed:
      //me retorna todas las listas de arr que tiene el completed
      return todos.where((todo) => todo.done).toList();

    case FilterType.pending:
      return todos.where((todo) => !todo.done).toList();
  }
}
