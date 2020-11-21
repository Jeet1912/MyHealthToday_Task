import 'dart:convert';
import 'package:http/http.dart';
import 'package:task/data_model/facts_model.dart';

class ApiService {
  Future<Facts> getFacts() async {
    var finalURL = "https://cat-fact.herokuapp.com/facts";
    Response response = await get(Uri.encodeFull(finalURL));
    if (response.statusCode == 200) {
      return Facts.fromJson(json.decode(response.body));
    } else {
      throw Exception("Cannot fetch data");
    }
  }
}
