import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/components/app_button.dart';
import 'package:to_do_app/core/components/app_text_field.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  void _showTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: const Center(child: Text("Add Task")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextField(
                controller: _titleController,
                hint: "Enter task title",
                label: "Task Title",
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: _subtitleController,
                label: "Task Subtitle",
                hint: "Enter task subtitle",
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            AppButton(
                  width: 100.w,
              buttonColor: AppColors.firebaseYellow,
              onPressed: () {
                Navigator.pop(context);
              },
              label:"Cancel",
            ),
            AppButton(
              width: 100.w,
              buttonColor: AppColors.firebaseYellow,
              onPressed: () {
                _titleController.clear();
                _subtitleController.clear();

                Navigator.pop(context);
              },
              label: "Add",
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text("Tasks"),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.notifications))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemBuilder: (context, index) => Card(
                  color: AppColors.wihte,
                  child: ListTile(
                    isThreeLine: true,
                    leading: Image.asset(AppAssets.toDo),
                    title: const Text(
                      "Flutter Firebase",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Working on firebase "),
                        Text(
                          "26 Dec 2024 - 6:00PM ",
                          style: TextStyle(
                              color: AppColors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      child: SizedBox(
                        width: 70.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {}, child: const Icon(Icons.edit)),
                            SizedBox(
                              width: 16.w,
                            ),
                            GestureDetector(
                                onTap: () {}, child: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
            itemCount: 10),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(context),
        backgroundColor: AppColors.firebaseYellow,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
