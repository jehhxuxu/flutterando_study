import 'package:api_study/home/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoRepository {
  final Dio _dio;
  final url = 'https://jsonplaceholder.typicode.com/todos/';
  TodoRepository([Dio client]) : _dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await _dio.get(url);
    final todoList = response.data as List;

    return todoList.map((json) => TodoModel.fromJson(json)).toList();
  }
}
