import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:make_it_rain/pages/textField.dart';

void main() async {
  List _data = await getJSON();
  
  for(var i = 0; i<_data.length; i++){
    print("Data: ${_data[i]["title"]}");
  }

  runApp(MaterialApp(
    title: "BMI",
    home: Home(),
  ));
}

Future<List> getJSON() async {
  String url = "https://jsonplaceholder.typicode.com/posts";

  http.Response response = await http.get(url);

  return json.decode(response.body);
} 