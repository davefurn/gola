import 'package:flutter/material.dart';
import 'package:task_management_app/Utils/app_colors.dart';
import 'package:task_management_app/screens/tasks.dart';
import 'package:task_management_app/widgets/button_widget.dart';
import 'package:get/get.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/welcome.jpg",
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.mainColors,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nstart your beautiful day",
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.2,
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => Add(),
                  transition: Transition.zoom,
                  duration: Duration(
                    milliseconds: 500,
                  ),
                );
              },
              child: ButtonWidget(
                  backgroundcolor: AppColors.mainColors,
                  text: "Add Task",
                  textColor: AppColors.textHolder),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => AllTasks(),
                  transition: Transition.fade,
                  duration: Duration(
                    seconds: 1,
                  ),
                );
              },
              child: ButtonWidget(
                backgroundcolor: AppColors.textHolder,
                text: "View All",
                textColor: AppColors.smallTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
