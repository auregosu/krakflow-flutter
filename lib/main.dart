import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const List<Task> tasks = [
    Task("Projekt Flutter", "Za kilka miesięcy", false, "Średni"),
    Task("Ćwiczenia z czegoś", "Pojutrze", false, "Wysoki"),
    Task("Przeczytać Lalkę", "Jakoś dwa lata temu", true, "Wysoki"),
    Task("Zrobić resztę zadań", "Za godzinę", true, "Niski"),
  ];

  const MyApp({super.key});
  // Application root widget
  @override
  Widget build(BuildContext context) {
    var tasksListView = ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Task task = tasks[index];
        return TaskCard(task: task);
      },
    );

    int completedTasks = tasks.where((t) => t.done).length;

    return MaterialApp(
      title: "krakflow",
      home: Scaffold(
        appBar: AppBar(title: Text("KrakFlow")),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Dzisiejsze zadania $completedTasks/${tasks.length}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(child: tasksListView),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String subtitle;
  final bool done;
  final String priority;

  const Task(this.title, this.subtitle, this.done, this.priority);
}

class TaskCard extends StatelessWidget {
  final Task task;
  //final IconData icon; Nie wydaje mi się mądre przechowywanie tego
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          task.done ? Icons.check_circle : Icons.radio_button_unchecked,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
          ),
        ),
        subtitle: Text(
          task.subtitle,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
          ),
        ),
        trailing: Text(
          task.priority,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: task.priority == "Wysoki"
                ? Colors.red
                : (task.priority == "Średni" ? Colors.orange : Colors.green),
          ),
        ),
      ),
    );
  }
}
