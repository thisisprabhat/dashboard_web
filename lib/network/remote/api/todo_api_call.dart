import 'package:dio/dio.dart';

class ToDoAPi {
  static Future<List<dynamic>> getToDoList() async {
    Response response;
    var dio = Dio();
    response = await dio.get('https://jsonplaceholder.typicode.com/todos');
    // print(response.data.toString());
// // Optionally the request above could also be done as
//     response =
//         await dio.get('/test', queryParameters: {'id': 12, 'name': 'wendu'});
//     print(response.data.toString());
    return response.data;
  }
}
