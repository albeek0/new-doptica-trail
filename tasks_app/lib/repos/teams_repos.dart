import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/team.dart';

class TeamsRepository {
  final String baseUrl =
      'http://164.68.99.191:2025'; // e.g., http://192.168.1.10:3000

  Future<List<Team>> fetchTeams() async {
    final response = await http.get(Uri.parse('$baseUrl/api#/groups'));

    if (response.statusCode == 200) {
      print('i am i here ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]');
      final List data = json.decode(response.body);
      print(response.body);
       print(data);
      return data.map((teamJson) => Team.fromJson(teamJson)).toList();
     
    } else {
      print(Error);
      throw Exception(Error);
    }
  }
}
