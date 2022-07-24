import 'package:get/get.dart';
import 'package:task_management_app/screens/add_task_screen.dart';
import 'package:task_management_app/screens/added.task.dart';
import 'package:task_management_app/screens/home_screen.dart';
import 'package:task_management_app/screens/tasks.dart';

import '../screens/view_task.dart';

class RoutesClass {
  static String home = "/";
  static String allTask = "/allTask";
  static String addTask = "/addTask";
  static String editTask = "/editTask";
  static String viewTask = "/viewTask";

  static String getHomeRoute() => home;
  static String getAllTaskRoute() => allTask;
  static String getAddTaskRoute() => addTask;
  static String geteditTaskRoute(String id) => '$editTask?id=$id';
  static String getviewTaskRoute(String id) => '$viewTask?id=$id';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(
      name: allTask,
      page: () => const AllTasks(),
      transition: Transition.fade,
      transitionDuration: const Duration(
        seconds: 1,
      ),
    ),
    GetPage(
      name: addTask,
      page: () => const Add(),
      transition: Transition.zoom,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: editTask,
      page: () {
        var id = Get.parameters['id'];
        return EditTask(
          id: int.parse(id!),
        );
      },
      transition: Transition.zoom,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
    GetPage(
      name: viewTask,
      page: () {
        var id = Get.parameters['id'];
        return ViewTask(
          id: int.parse(id!),
        );
      },
      transition: Transition.zoom,
      transitionDuration: const Duration(
        milliseconds: 500,
      ),
    ),
  ];
}
