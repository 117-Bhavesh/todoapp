/*


TO DO VIEW: RESPONSIBLE FOR UI

-use BlockBuilder

 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/presentation/todo_cubit.dart';
import 'package:todoapp/domain/models/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  //show dialog box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();
    
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(controller: textController),
          actions: [
            //cancel button
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),

            //add button
            TextButton(
              onPressed: () {
                todoCubit.addTodo(textController.text); //before popping the box
                // we will go to the todoCubit and add the todo
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
    );
  }


  // BUILD UI-------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    //todo cubit
    final todoCubit = context.read<TodoCubit>();

    //SCAFFOLD
    return Scaffold(
      //FAB = floating action button
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),

      //BLOC BUILDER
      //everytime we use a BLOC BUILDER we just need to specify the todoCubit
      // and also the type which is list of todo here
      body: BlocBuilder<TodoCubit,List<Todo>>(
        builder: (context, todos) {
          //List View
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              //get individual todo from todos list
              final todo = todos[index];

              //list Tile UI
              return ListTile(
                //text
                title: Text(todo.text),

                //check box
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubit.toggleCompletion(todo),
                ),

                //delete button
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => todoCubit.deleteTodo(todo),
                ),
              );
            },
          );
        }
      ),
    );
  }
}

