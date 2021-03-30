import 'dart:convert';
import 'package:mlearning/model/Teori.dart';
import 'package:mlearning/model/Course.dart';
import 'package:http/http.dart' as http;

class api_teori {
  Future<List<Teori>> getAll() async {
    final response = await http.get('https://toko-klambi.000webhostapp.com/index.php/makul');

    if (response.statusCode == 200) {
      print(response.body);

      Iterable decoded = jsonDecode(response.body);

      List<Teori> result = decoded.map((x) => Teori.fromJson(x)).toList();

      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}

class api_course {
  Future<List<Course>> getAll() async {
    final response = await http.get('https://toko-klambi.000webhostapp.com/index.php/makul');

    if (response.statusCode == 200) {
      print(response.body);

      Iterable decoded = jsonDecode(response.body);

      List<Course> result = decoded.map((x) => Course.fromJson(x)).toList();

      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}