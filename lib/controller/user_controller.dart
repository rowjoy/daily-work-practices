import 'package:get/get.dart';
import 'package:imagetotext/String/string.dart';
import 'package:imagetotext/model/user_model.dart';
import 'package:imagetotext/service/api_service.dart';

class UserProfileController extends GetxController {
  Future<List<UserModel>> getuserdata() async {
    List data =
        await ApiService.getdata(baseUrl: Strings.fackurl, url: Strings.users);
    // ignore: unnecessary_null_comparison
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  void onInit() {
    getuserdata();
    super.onInit();
  }
}
