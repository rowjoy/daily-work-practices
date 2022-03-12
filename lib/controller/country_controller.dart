import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/service/api_service.dart';

final ApiService _apiService = ApiService();

class CountryList extends GetxController {
  Map countylist = {}.obs;

  Future getCountry() async {
    countylist = await ApiService.getdata(
      baseUrl: Strings.countryBaseUrl,
      url: Strings.countryUrl,
    );
    print('countrylist :$countylist');
  }
}
