// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:imagetotext/String/helper.dart';

class ApiService {
  static Future getdata({
    required String baseUrl,
    required String url,
  }) async {
    try {
      final responce = await http.get(Uri.parse('$baseUrl/$url'));
      if (responce.statusCode == 200) {
        print(responce.body);
        var jsonString = jsonDecode(responce.body);
        return jsonString;
      } else {
        var errorbody = jsonDecode(responce.body);
        Helper.showsnackber(title: 'massage', message: errorbody['message']);
      }
    } on SocketException catch (_) {
      Helper.showsnackber(
          title: 'massage', message: 'Please Check your Internet Connection');
    } on HttpException catch (error) {
      Helper.showsnackber(title: 'massage', message: error.message);
    } on FormatException catch (error) {
      Helper.showsnackber(title: 'massage', message: error.message);
    } catch (error) {
      Helper.showsnackber(message: '$error');
    }
  }

  static Future postdata({
    required String baseUri,
    required String uri,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    try {
      EasyLoading.show(status: 'loading...');
      final responce = await http.post(
        Uri.parse('$baseUri/$uri'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );
      if (responce.statusCode == 201) {
        var jsonString = jsonDecode(responce.body);
        return jsonString;
      } else {
        var errorbody = jsonDecode(responce.body);
        Helper.showsnackber(title: 'massage', message: errorbody['message']);
        print("New Token ${errorbody['token']}");
        EasyLoading.dismiss();
      }
    } on SocketException catch (_) {
      Helper.showsnackber(
          title: 'Hello1', message: "Please Check our Internet Connection");
    } on HttpException catch (error) {
      Helper.showsnackber(title: 'Hello2', message: error.message);
    } on FormatException catch (error) {
      Helper.showsnackber(message: error.message);
    } catch (error) {
      Helper.showsnackber(message: '$error');
    }
  }
}
