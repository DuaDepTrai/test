import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  String title;
  bool isDone;

  Task(this.title, {this.isDone = false});
}

class TaskRepository {
  final List<Task> _tasks = [
    Task("Learn Flutter"),
    Task("Do homework"),
  ];

  List<Task> findAll() => _tasks;

  void add(Task task) {
    _tasks.add(task);
  }

  void addAll(List<Task> tasks) {
    _tasks.addAll(tasks);
  }

  bool hasDuplicate(List<Task> newTasks) {
    return newTasks.any((newTask) =>
        _tasks.any((t) => !t.isDone && t.title == newTask.title));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

/// ================= PAGE 1 =================
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController txtUser = TextEditingController();

  void doLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TaskPage(username: txtUser.text, repository: TaskRepository()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/avatar.jpg", height: 100),
            const SizedBox(height: 10),
            const Text("Welcome back!"),
            const SizedBox(height: 10),
            TextField(
              controller: txtUser,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => doLogin(context),
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}

/// ================= PAGE 2 =================
class TaskPage extends StatefulWidget {
  final String username;
  final TaskRepository repository;

  const TaskPage(
      {super.key, required this.username, required this.repository});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> displayList = [];
  final TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayList = widget.repository.findAll();
  }

  void search() {
    String keyword = txtSearch.text.toLowerCase();

    setState(() {
      displayList = widget.repository
          .findAll()
          .where((t) => t.title.toLowerCase().contains(keyword))
          .toList();
    });
  }

  void goToAdd() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskPage(
          username: widget.username,
          repository: widget.repository,
        ),
      ),
    ).then((_) {
      setState(() {
        displayList = widget.repository.findAll();
      });
    });
  }

  void toggle(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Page")),
      body: Column(
        children: [
          Image.asset("assets/avatar.jpg", height: 80),
          Text("Welcome ${widget.username}"),

          // SEARCH
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtSearch,
                    decoration:
                    const InputDecoration(labelText: "Search"),
                    onSubmitted: (_) => search(),
                  ),
                ),
                IconButton(
                  onPressed: goToAdd,
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),

          // LIST
          Expanded(
            child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                var task = displayList[index];

                return ListTile(
                  leading: Icon(
                    task.isDone
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.isDone ? Colors.green : null,
                  ),
                  title: Text(task.title),
                  onTap: () => toggle(task),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

/// ================= PAGE 3 =================
class AddTaskPage extends StatelessWidget {
  final String username;
  final TaskRepository repository;

  AddTaskPage({
    super.key,
    required this.username,
    required this.repository,
  });

  final txt1 = TextEditingController();
  final txt2 = TextEditingController();
  final txt3 = TextEditingController();

  void add(BuildContext context) {
    List<String> inputs = [
      txt1.text.trim(),
      txt2.text.trim(),
      txt3.text.trim()
    ];

    // loại bỏ input rỗng
    List<String> validInputs =
    inputs.where((t) => t.isNotEmpty).toList();

    if (validInputs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phải nhập ít nhất 1 task")),
      );
      return;
    }

    // ✅ CHECK TRÙNG TRONG INPUT
    var uniqueSet = validInputs.toSet();
    if (uniqueSet.length != validInputs.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Các task không được trùng nhau")),
      );
      return;
    }

    // convert sang Task
    List<Task> newTasks =
    validInputs.map((t) => Task(t)).toList();

    // validate duplicate
    if (repository.hasDuplicate(newTasks)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Có task bị trùng (chưa completed)")),
      );
      return;
    }

    // add all
    repository.addAll(newTasks);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/avatar.jpg", height: 80),
            Text("Welcome $username"),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: txt1,
                    decoration:
                    const InputDecoration(labelText: "Task 1"),
                  ),
                  TextField(
                    controller: txt2,
                    decoration:
                    const InputDecoration(labelText: "Task 2"),
                  ),
                  TextField(
                    controller: txt3,
                    decoration:
                    const InputDecoration(labelText: "Task 3"),
                  ),
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () => add(context),
              child: const Text("Add to list"),
            )
          ],
        ),
      ),
    );
  }
}