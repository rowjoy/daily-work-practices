import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/country_model.dart';
import 'package:imagetotext/service/api_service.dart';

final ApiService _apiService = ApiService();

class CountryList extends GetxController {
  RxList countryData = [].obs;
  Future getCountry() async {
    ApiService.getdata(
      baseUrl: Strings.countryBaseUrl,
      url: Strings.countryUrl,
    ).then((value) {
      for (var i in value["countries"]) {
        countryData.add(CountryModel.fromJson(i));
        print(countryData.length);
      }
    });
  }

  @override
  void onInit() {
    getCountry();
    super.onInit();
  }
}
