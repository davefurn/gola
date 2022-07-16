import 'package:http/http.dart';

import '../services/services.dart';

class DataController{
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    try {
      if (response.statusCode == 200) {
        _myData = response.body as List;
        
        print("we got the data");
      } else {
        print("we didn't get the data" + response.body);
      }
    } catch (e) {
      print("error in the controller is " + e.toString());
    }
  }

//   Future<void> postData(String task, String taskDetail) async {
//     _isLoading = true;
//     Response response = await service.postData({
//       "task_name": task,
//       "task_details": taskDetail,
//     });
//     print(response.body);
//     try {
//   if (response.statusCode == 200) {
//     update();
//     print("data post successful");
//   } else {
//     print("data post failed"+ response.body );
//   }
// }  catch (e) {
//  print("error in the controller is " + e.toString());
// }
//   }
}
