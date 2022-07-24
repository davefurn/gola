import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/controllers/data_controllers.dart';
import 'package:task_management_app/routes/routes.dart';
import 'package:task_management_app/screens/home_screen.dart';

import 'screens/add_task_screen.dart';
import 'screens/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesClass.getHomeRoute(),
      getPages: RoutesClass.routes,
    );
  }
}
