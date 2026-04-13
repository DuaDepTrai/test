import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Todo {
  String todoContent;
  DateTime createdAt;

  Todo(this.todoContent, this.createdAt);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController txtTodo = TextEditingController();
  final List<Todo> todos = [];

  void addTodo() {
    String content = txtTodo.text.trim();

    if (content.isEmpty) return;

    var todo = Todo(content, DateTime.now());

    setState(() {
      todos.add(todo);
      txtTodo.clear();
    });
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          // INPUT + BUTTON
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtTodo,
                    decoration: const InputDecoration(
                      hintText: "Enter todo...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: addTodo,
                  icon: const Icon(Icons.add),
                  color: Colors.green,
                )
              ],
            ),
          ),

          // LIST
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                var todo = todos[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(todo.todoContent),
                    subtitle: Text("Created: ${formatDate(todo.createdAt)}"),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}