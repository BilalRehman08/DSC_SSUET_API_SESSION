import 'dart:convert';
import 'package:api/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Users>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Users.fromJsonList(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Users');
    }
  }
}
