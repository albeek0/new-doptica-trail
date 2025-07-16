import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasks_app/models/new_group.dart';

class GroupService {
  static const String _baseUrl = 'http://localhost:3000/groups'; // 🔁 change to your backend URL

  static Future<Group?> createGroup(Group group) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(group.toJson()),
    );

    if (response.statusCode == 201) {
      return Group.fromJson(jsonDecode(response.body));
    } else {
      print('Error creating group: ${response.body}');
      return null;
    }
  }
}
