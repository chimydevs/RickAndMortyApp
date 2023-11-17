

import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider with ChangeNotifier {
  final url = 'rickandmortyapi.com';
  List<Character> characters = [];


  Future<void> getCharacters()async{
    final result = await http.get(Uri.https(url, "/api/character"));
    final response = characterResponseFromJson(result.body);
    characters.addAll(response.results!);
    notifyListeners();
  }

}