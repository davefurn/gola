import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Utils/app_colors.dart';
import 'package:task_management_app/controllers/data_controllers.dart';
import 'package:task_management_app/routes/routes.dart';
import 'package:task_management_app/widgets/button_widget.dart';
import 'package:task_management_app/widgets/error_warning_ms.dart';

import '../widgets/textfield_widget.dart';
import 'tasks.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController detailcontroller = TextEditingController();

    bool _dataValidation() {
      if (namecontroller.text.trim() == '') {
        Message.taskErrorOrWarning("Task name", "Your task name is empty");
        return false;
      } else if (detailcontroller.text.trim() == '') {
        Message.taskErrorOrWarning("Task detail", "Your task detail is empty");
        return false;
      } else if (namecontroller.text.length <= 10) {
        Message.taskErrorOrWarning(
            "Task name", "Your task name should be at least 10 characters");
        return false;
      } else if (detailcontroller.text.length <= 20) {
        Message.taskErrorOrWarning(
            "Task detail", "Your task detail should be at least 20 characters");
        return false;
      }
      return true;
    }

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/addtask1.jpg"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
                    )),
              ],
            ),
            Column(
              children: [
                TestFieldWidget(
                  hintText: 'Task name',
                  textcontroller: namecontroller,
                ),
                const SizedBox(
                  height: 20,
                ),
                TestFieldWidget(
                  borderRadius: 15,
                  hintText: 'Task detail',
                  textcontroller: detailcontroller,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_dataValidation()) {
                      Get.find<DataController>().postData(
                        namecontroller.text.trim(),
                        detailcontroller.text.trim(),
                      );
                      // Get.to(
                      //   () => AllTasks(),
                      //   transition: Transition.circularReveal,
                      // );
                      Get.offNamed(RoutesClass.getAllTaskRoute());
                    }
                  },
                  child: ButtonWidget(
                      backgroundcolor: AppColors.mainColors,
                      text: "Add",
                      textColor: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            )
          ],
        ),
      ),
    );
  }
}
