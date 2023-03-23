import 'package:flutter/material.dart';
import 'package:todo_list_bloc_state/blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);

TextEditingController titleController = TextEditingController();
void _addTask(BuildContext context){
  showModalBottomSheet(
    context: context,
     builder:(context) => SingleChildScrollView(
 child: Container(
  padding : EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),

  child: Column(children: [
    TextField(
      controller: titleController,
    )
  ],)
  )

     ),
  );
}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.allTasks;
      return Scaffold(
        appBar: AppBar(
          title: const Text('TODO LIST'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Chip(
                label: Text(
                  'Tasks:',
                ),
              ),
            ),
            TasksList(tasksList: tasksList)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTask(context),
          tooltip: 'Add task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
