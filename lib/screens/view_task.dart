import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Utils/app_colors.dart';
import 'package:task_management_app/controllers/data_controllers.dart';
import 'package:task_management_app/widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({Key? key, required this.id}) : super(key: key);
  _loadSingleTask() async {
    print("passed is  " +id.toString());
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    _loadSingleTask();
    TextEditingController namecontroller = TextEditingController();
    TextEditingController detailcontroller = TextEditingController();
    return Scaffold(
      body: GetBuilder<DataController>(
        builder: (controller) {
           namecontroller.text =
              controller.singleData["task_name"] ?? "task name not found";
          detailcontroller.text =
              controller.singleData["task_details"] ?? "task details not found";
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
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
                      constraints: BoxConstraints(),
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TestFieldWidget(
                      textcontroller: namecontroller,
                      hintText: "Task name",
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TestFieldWidget(
                      textcontroller: detailcontroller,
                      hintText: "Task Details",
                      borderRadius: 15,
                      maxLines: 3,
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
