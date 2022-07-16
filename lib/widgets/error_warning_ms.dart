import 'package:get/get.dart';

import '../Utils/app_colors.dart';
import 'package:flutter/material.dart';

class Message {
  static void taskErrorOrWarning(String taskName, String taskErrorOrWarning) {
    Get.snackbar(
      taskName,
      taskErrorOrWarning,
      backgroundColor: AppColors.mainColors.withOpacity(0.7),
      titleText:   Text(
         taskName, style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
         ),
      ),
      messageText:   Text(
         taskErrorOrWarning, style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
         ),
      )
      
      

    );
  }
}
