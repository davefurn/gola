import 'package:http/http.dart';

class DataService {
  Future<Response> getData() async {
    Uri uri = Uri.parse("http://localhost:8082/gettasks");
    Response response = await get(uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});
    return response;
  }

  // Future<Response> postData(dynamic body) async {
  //   Response response = await post("https://localhost:8082/create", body,
  //       headers: {'Content-Type': 'application/json; charset=UTF-8'});
  //   return response;
  // }
}
