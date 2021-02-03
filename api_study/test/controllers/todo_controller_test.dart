import 'package:api_study/home/controllers/todo_controller.dart';
import 'package:api_study/home/models/todo_model.dart';
import 'package:api_study/home/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final _repository = TodoRepositoryMock();
  final _controller = TodoController(_repository);
  test('todoList is not empty', () async {
    when(_repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    await _controller.start();
    expect(_controller.todoList.isNotEmpty, true);
  });

  test('states values ok', () async {
    when(_repository.fetchTodos()).thenAnswer((_) async => [TodoModel()]);
    expect(_controller.state.value, HomeState.start);
    await _controller.start();
    expect(_controller.state.value, HomeState.success);
  });

  test('error state', () async {
    when(_repository.fetchTodos()).thenThrow(Exception());
    expect(_controller.state.value, HomeState.start);
    await _controller.start();
    expect(_controller.state.value, HomeState.error);
  });
}
