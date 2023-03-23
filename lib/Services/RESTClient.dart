import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as Http;

class HttpServices {
  static const _baseUrl = 'https://freshfoods.cehpoint.com/';

  static Future<Map<String, dynamic>?> sendGetReq(String path) async {
    Map<String, dynamic>? result;
    await Http.get(Uri.parse(_baseUrl + path), headers: {
      'Content-Type': 'application/json',
    }).then((response) {
      if (response.statusCode == 500) {
        debugPrint('Lmao server ded');
      }
      result = jsonDecode(response.body);
      print(result);
    });
    return result;
  }

  static Future<Map<String, dynamic>?> sendPostReq(String path,
      {Map<String, dynamic>? body}) async {
    Map<String, dynamic>? result;
    debugPrint('sendPostReq: $_baseUrl$path');
    debugPrint('body: $body');
    await Http.post(Uri.parse(_baseUrl + path),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body))
        .then((response) {
      debugPrint(response.toString());
      if (response.statusCode == 500) {
        debugPrint('Lmao server ded');
      }
      result = jsonDecode(response.body);
    });
    return result;
  }
}