import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> currentTasks;

  TasksList(this.currentTasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.currentTasks[index].name,
          isChecked: widget.currentTasks[index].isDone,
          checkboxCallback: (bool checkboxState) {
            //CALLBACKS ARE USUALLY ANONYMOUS, SO WE DONT CALL THEM
            setState(() {
              widget.currentTasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.currentTasks.length,
      padding: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 0,
      ),
    );
  }
}
