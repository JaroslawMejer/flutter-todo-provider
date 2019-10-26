import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  Function addNewTask;

  String typedName;

  AddTaskScreen({this.addNewTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (String value) {
                  typedName = value;
                  print(typedName);
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              FlatButton(
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15.0),
                  child: Text('Add'),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Provider.of<TaskData>(context).addTask(typedName);
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
