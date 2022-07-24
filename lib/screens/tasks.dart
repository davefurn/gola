import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task_management_app/controllers/data_controllers.dart';
import 'package:task_management_app/routes/routes.dart';
import 'package:task_management_app/screens/view_task.dart';
import 'package:task_management_app/widgets/button_widget.dart';
import 'package:task_management_app/widgets/tasks_widgets.dart';

import '../Utils/app_colors.dart';
import 'added.task.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);
  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.find<DataController>().myData.length);
    _loadData();

    List myData = [
      "Try harder",
      "Try smarter",
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<DataController>(
          builder: (controller) {
            return controller.isLoading == false
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 60,
                        ),
                        alignment: Alignment.topLeft,
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height / 3.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/header.jpg")),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: AppColors.secondaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                color: Colors.black,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.calendar_month_sharp,
                              color: AppColors.secondaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.secondaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          itemCount: controller.myData.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              background: leftEditIcon,
                              secondaryBackground: rightDeleteIcon,
                              onDismissed: (DismissDirection direction) {
                                print("after dismiss");
                              },
                              confirmDismiss:
                                  (DismissDirection direction) async {
                                if (direction == DismissDirection.startToEnd) {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      builder: (_) {
                                        return Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: AppColors.mainColors
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //   Get.off(() => ViewTask(
                                                    //       id: int.parse(controller
                                                    //           .myData[index]["id"]
                                                    //           .toString())));
                                                    //         .toString())));
                                                    Get.toNamed(RoutesClass
                                                        .getviewTaskRoute(
                                                            controller
                                                                .myData[index]
                                                                    ["id"]
                                                                .toString()));
                                                  },
                                                  child: ButtonWidget(
                                                      backgroundcolor:
                                                          AppColors.mainColors,
                                                      text: "View",
                                                      textColor: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // Get.off(() => EditTask(
                                                    //     id: int.parse(controller
                                                    //         .myData[index]["id"]
                                                    //         .toString())));
                                                    Get.toNamed(RoutesClass
                                                        .geteditTaskRoute(
                                                            controller
                                                                .myData[index]
                                                                    ["id"]
                                                                .toString()));
                                                  },
                                                  child: ButtonWidget(
                                                      backgroundcolor:
                                                          AppColors.mainColors,
                                                      text: "Edit",
                                                      textColor: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                  return false;
                                } else {
                                  controller.deleteData(
                                      int.parse(controller.singleData["id"]));
                                  return Future.delayed(Duration(seconds: 1),
                                      () async {
                                    await controller.getData();

                                    return direction ==
                                        DismissDirection.endToStart;
                                  });
                                }
                              },
                              key: ObjectKey(index),
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: 10,
                                ),
                                child: TasksWidget(
                                  text: controller.myData[index]["task_name"],
                                  color: Colors.blueGrey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: SpinKitThreeInOut(
                      itemBuilder: (context, index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    ),
                  );
          },
        ));
  }
}
