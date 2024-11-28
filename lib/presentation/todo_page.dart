/*

To do Page: responsible for providing cubit to view (UI)

-use BlockProvider

 */

import 'package:flutter/material.dart';
import 'package:todoapp/domain/repository/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/presentation/todo_cubit.dart';
import 'todo_view.dart';



class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo; //accepting the repo at the top
  
  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}

