// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/country_model.dart';
import 'package:imagetotext/service/api_service.dart';

class CountryList extends GetxController {
  Future<List<Country>> getCountry() async {
    List dataset = [].obs;
    Map data = await ApiService.getdata(
      baseUrl: Strings.countryBaseUrl,
      url: Strings.countryUrl,
    );
    print("DATA GET ${data["countries"]}");
    if (data.isNotEmpty) {
      for (var i in data["countries"]) {
        dataset.add(i);
        // ignore: unnecessary_brace_in_string_interps
        print("GET DATA 2 ${dataset}");
      }
    }
    return dataset.map((e) => Country.fromJson(e)).toList();
  }

  @override
  void onInit() {
    getCountry();
    super.onInit();
  }
}
