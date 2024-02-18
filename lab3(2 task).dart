import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  bool isCompleted;

  Task({required this.title, required this.description, this.isCompleted = false});
}

class ToDoList {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(String title) {
    tasks.removeWhere((task) => task.title == title);
  }

  void changeTaskStatus(String title, bool isCompleted) {
    Task? task = tasks.firstWhere((task) => task.title == title, orElse: () => Task(title: '', description: '', isCompleted: false));
    if (task.title.isNotEmpty) {
      task.isCompleted = isCompleted;
    }
  }

  void displayAllTasks() {
    tasks.forEach((task) {
      print('Title: ${task.title}, Description: ${task.description}, Completed: ${task.isCompleted}');
    });
  }

  List<Task> getAllCompletedTasks() {
    return tasks.where((task) => task.isCompleted).toList();
  }

  List<Task> getAllOutstandingTasks() {
    return tasks.where((task) => !task.isCompleted).toList();
  }

  void clearCompletedTasks() {
    tasks.removeWhere((task) => task.isCompleted);
  }
}

void main() {
  ToDoList toDoList = ToDoList();

  // Example Usage:
  toDoList.addTask(Task(title: 'Task 1', description: 'Description 1'));
  toDoList.addTask(Task(title: 'Task 2', description: 'Description 2', isCompleted: true));

  toDoList.displayAllTasks();

  print('Completed Tasks:');
  toDoList.getAllCompletedTasks().forEach((task) {
    print('Title: ${task.title}, Description: ${task.description}');
  });

  print('Outstanding Tasks:');
  toDoList.getAllOutstandingTasks().forEach((task) {
    print('Title: ${task.title}, Description: ${task.description}');
  });

  toDoList.clearCompletedTasks();
  print('After Clearing Completed Tasks:');
  toDoList.displayAllTasks();
}
