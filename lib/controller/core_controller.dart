
import 'dart:developer';

import 'package:get/get.dart';

import '../models/user_model.dart';
import '../utils/storage_helper.dart';
import '../utils/storage_keys copy.dart';

class CoreController extends GetxController {
  RxBool darkTheme = RxBool(false);
  User? currentUser;

  bool isFirstTimeUser() {
    var appLoadDate = StorageHelper.getAppLoadedDate();
    return appLoadDate == null;
  }

  @override
  void onInit() async {
    // loadCurrentUser();

    super.onInit();
  }

  // void loadCurrentUser() async {
  //   log("----------->>>>>>>>>>>>>>isUserLoggedIn--------${currentUser}");
  //   currentUser = StorageHelper.getUser();
  // }

  // bool isUserLoggedIn() {
  //   loadCurrentUser();
  //   log("----------->>>>>>>>>>>>>>isUserLoggedIn--------${currentUser}");
  //   return currentUser != null;
  // }

  // void logOut() async {
  //   final box = GetStorage();
  //   await box.write(StorageKeys.ACCESS_TOKEN, null);
  //   await box.write(StorageKeys.USER, null);
  //   loadCurrentUser();
  //   Get.offAllNamed(LogInScreen.routeName);
  // }
}
