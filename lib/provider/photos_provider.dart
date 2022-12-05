import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class PhotosProvider extends ChangeNotifier {
  final String _baseUrl = 'jsonplaceholder.typicode.com';
  List<Photo> photoResults = [];

  PhotosProvider() {
    getPhotos();
  }

  Future<String> _getJsonData(String segmentUrl, [int page = 1]) async {
    final url = Uri.https(_baseUrl, segmentUrl);

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return 'Error en la petición';
    }

    return response.body;
  }

  getPhotos() async {
    final jsonData = await _getJsonData('/photos');

    photoResults = modelPhotosFromJson(jsonData);
    print(photoResults[0].title);

    notifyListeners();
  }
}
