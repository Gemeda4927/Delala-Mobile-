part of 'todo_bloc.dart';


abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;
  TodoLoaded({required this.todos});
}

class TodoFailure extends TodoState{
  final String errorMesage;
  TodoFailure({required this.errorMesage});
}

class TodoAdded extends TodoState{
  
}