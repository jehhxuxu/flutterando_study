import 'package:api_study/home/models/todo_model.dart';
import 'package:api_study/home/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';

class TodoController {
  List<TodoModel> todoList = [];
  final TodoRepository _repository;
  ValueNotifier<HomeState> state = ValueNotifier(HomeState.start);

  TodoController([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future<void> start() async {
    state.value = HomeState.loading;
    try {
      todoList = await _repository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
