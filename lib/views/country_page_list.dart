// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagetotext/controller/country_controller.dart';
import 'package:http/http.dart' as http;
import 'package:imagetotext/model/country_model.dart';

class CountryPage extends StatefulWidget {
  CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final CountryList _countryList = Get.put(CountryList());
  // Map country = {};
  // Future getdata() async {
  //   final responce =
  //       await http.get(Uri.parse('https://ibank.com.bd//api/v1/country'));
  //   if (responce.statusCode == 200) {
  //     setState(() {
  //       country = jsonDecode(responce.body);
  //       List contrylist = country['countries'];
  //       print(contrylist);
  //       if (country.isEmpty) {
  //         return null;
  //       }
  //     });
  //   }
  //   print(country.length);
  // }

  // @override
  // void initState() {
  //   getdata();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder<List<Country>>(
            future: _countryList.getCountry(),
            builder: (context, snapSort) {
              if (snapSort.hasData) {
                // ignore: avoid_print
                print(" getdata${snapSort.data}");
                List<Country>? data = snapSort.data;

                return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              Text("${data[index].name}"),
                              Text("${data[index].isoCode}"),
                              Text("${data[index].code3}"),
                              Text("${data[index].nationality}"),
                              Text("${data[index].riskFactor}"),
                              Text("${data[index].fiscalRef}"),
                              Text("${data[index].seqId}"),
                              Text("${data[index].fiscalRef}"),
                              Text("${data[index].callingCode}"),
                            ],
                          ),
                        ),
                      );
                    });
              }
              return Center(
                child: Text("Lodding..."),
              );
            },
          ),
        ),
      ),
    );
  }
}
