/*

TO DO MODEL

This is what a todo object is.

--------------------------------------------------------------------------------

It has these properties:

- id
- text
- isCompleted

--------------------------------------------------------------------------------

Methods:

- toggle completion on and off

 */



class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  //Todo Object
  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false,  //initially, todo is incomplete
  });

  Todo toggleCompletion() {
    return Todo(
      id: id,
      text: text,
      isCompleted: !isCompleted,
    );
  }
}