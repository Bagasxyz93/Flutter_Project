import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'item.dart';

class Repo {
  final _baseUrl = 'https://6849404045f4c0f5ee70a090.mockapi.io/learnJson/api';

  Future getData() async{
    try {
      final response = await http.get(Uri.parse(_baseUrl +'/items'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Item> item = it.map((e) => Item.fromJson(e)).toList();
        return item;
      }else{
        throw Exception('Gagal mengambil Data : ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw Exception('Terjadi Kesalahan : $e');
    }
  }

  Future<Item?> postData(String name, String description) async{
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/items'),
        body: {
          "name" : name,
          "description" : description
        }
      );

      if(response.statusCode == 201){
        final data = jsonDecode(response.body);
        return Item.fromJson(data);
      }else{
        return null;
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw Exception('Terjadi Masalah : $e');
    }
  }

  Future<bool> deleteData(String id) async{
    try {
      final response = await http.delete(Uri.parse(_baseUrl + '/items/$id'));

      if(response.statusCode == 200){
        return true;
      }else{
        debugPrint('Gagal menghapus data : ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw Exception('Terjadi Masalah : $e');
    }
  }
}