// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagetotext/controller/country_controller.dart';
import 'package:imagetotext/service/api_service.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final CountryList _countryList = Get.put(CountryList());
  Map country = {};
  Future getdata() async {
    final responce =
        await http.get(Uri.parse('https://ibank.com.bd//api/v1/country'));
    if (responce.statusCode == 200) {
      setState(() {
        country = jsonDecode(responce.body);
        List contrylist = country['countries'];
        print(contrylist);
        if (country.isEmpty) {
          return null;
        }
      });
    }
    print(country.length);
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: country.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(country['countries']));
          },
        ),
      ),
    );
  }
}