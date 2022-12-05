import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:placeholder/models/models.dart';

class UsersProvider extends ChangeNotifier {
  final String _baseUrl = 'jsonplaceholder.typicode.com';
  List<User> usersResults = [];

  UsersProvider() {
    getUsers();
  }

  Future<String> _getJsonData(String segmentUrl, [int page = 1]) async {
    final url = Uri.https(_baseUrl, segmentUrl);

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return 'Error en la petición';
    }

    return response.body;
  }

  getUsers() async {
    final jsonData = await _getJsonData('/users');

    usersResults = modelUserFromJson(jsonData);

    print(usersResults[0].name);

    notifyListeners();
  }
}
