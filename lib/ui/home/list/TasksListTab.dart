import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/AppDateUtils.dart';
import 'package:todo/database/models/Task.dart';
import 'package:todo/providers/AuthProvider.dart';
import 'package:todo/providers/TasksProvider.dart';
import 'package:todo/ui/DialogUtils.dart';
import 'package:todo/ui/home/list/TaskItem.dart';

import '../../../edit_task_screen.dart'; // تأكد من وجود هذا الملف

class TasksListTab extends StatefulWidget {
  const TasksListTab({super.key});

  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  late AppAuthProvider authProvider;
  late TasksProvider tasksProvider;
  var selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AppAuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    tasksProvider = Provider.of<TasksProvider>(context);
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: selectedDate,
          onDateChange: (clickedDate) {
            setState(() {
              selectedDate = clickedDate;
            });
          },
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<Task>>(
            stream: tasksProvider.tasksCollection.listenForTasks(
              authProvider.authUser?.uid ?? "",
              selectedDate.dateOnly(),
            ),
            builder: (buildContext, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text("Something went wrong"),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text("Try again"),
                      ),
                    ],
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var tasksList =
                  snapshot.data?.docs.map((doc) => doc.data()).toList();

              return ListView.separated(
                itemBuilder: (context, index) {
                  final task = tasksList![index];
                  return tasksList == null || tasksList.isEmpty
                      ? Center(
                          child:
                              Text("No tasks available for the selected date"),
                        )
                      : TaskItem(
                          title: task.title ?? "No Title",
                          description: task.description ?? "No Description",
                          time: task.time?.toString() ?? "No Time",
                          isDone: task.isDone ?? false,
                          onDeleteClick: () => deleteTask(task),
                          onEditClick: () {
                            Navigator.pushNamed(
                              context,
                              EditTaskScreen.routeName,
                              arguments: task,
                            );
                          },
                        );
                },
                separatorBuilder: (_, __) => Container(
                  height: 24,
                ),
                itemCount: tasksList?.length ?? 0,
              );
            },
          ),
        ),
      ],
    );
  }

  void deleteTask(Task task) async {
    showLoadingDialog(context, message: "Please wait...");
    try {
      await tasksProvider.removeTask(authProvider.authUser?.uid ?? "", task);
      hideLoading(context);
      setState(() {});
    } catch (e) {
      showMessageDialog(
        context,
        message: "Something went wrong ${e.toString()}",
        posButtonTitle: "Retry",
        posButtonAction: () {
          deleteTask(task);
        },
      );
    }
  }
}
