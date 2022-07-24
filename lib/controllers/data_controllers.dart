import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_management_app/Utils/app_constants.dart';

import '../services/services.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    try {
      if (response.statusCode == 200) {
        _myData = response.body;
        print("we got the data");
        
      } else {
        print("we didn't get the data" + response.body);
      }
    } catch (e) {
      print("error in the controller is " + e.toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response =
        await service.getData('${AppConstants.GET_TASK}' '?id=$id');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("we got the single data" + jsonEncode(response.body));
        print(response.body.toString());
        _singleData = response.body;
      }
      update();
    } else {
      print("we didn't get the single data");
    }
    _isLoading = false;
    update();
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.POST_TASKS, {
      "task_name": task,
      "task_details": taskDetail,
    });
    print(response.body);
    if (response.statusCode == 200) {
    
      print("data post successful");
    } else {
      print("data post failed");
    }
    update();
  }

  Future<void>  updateData(String task, String taskDetail, int id) async {
    _isLoading = true;
    Response response =
        await service.updateData('${AppConstants.UPDATE_TASKS}' '?id=$id', {
      "task_name": task,
      "task_details": taskDetail,
    });
    print(response.body);
    if (response.statusCode == 200) {
     
      print("data post successful");
    } else {
      print("data post failed");
    }
    update();
  }

   Future<void>  deleteData(int id) async {
    _isLoading = true;
    update();
    Response response =
        await service.deleteData('${AppConstants.DELETE_TASKS}' '?id=$id');
    print(response.body);
    if (response.statusCode == 200) {
     
      print("data deleted successful");
    } else {
      print("data delete failed");
    }
    await Future.delayed(Duration(seconds: 1), (){
       _isLoading = false;
       update();
    });
    
  }
}
