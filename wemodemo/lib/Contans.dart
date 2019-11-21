import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/Client.dart';


class Contans {
  static const ROOT = 'https://3107093d.ngrok.io';

  static List<Client> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Client>((json) => Client.fromJson(json)).toList();
  }

  static Future<List<Client>> getClients() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = "GET_ALL";
      final response = await http.post(ROOT, body: map);
      if (200 == response.statusCode) {
        List<Client> list = parseResponse(response.body);
        return list;
      } else {
        return List<Client>();
      }
    } catch (e) {
      return List<Client>();
    }
  }
 
}