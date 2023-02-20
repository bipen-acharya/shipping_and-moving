import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../../repo/auth_repo.dart';
import '../../widgets/custom_snackbar.dart';

class RegisterController extends GetxController {
  var registerFormKey = GlobalKey<FormState>();

  SimpleFontelicoProgressDialog loading = SimpleFontelicoProgressDialog(
      context: Get.context, barrierDimisable: false);

  // var formKey = GlobalKey<FormState>()
  var passwordObscure = true.obs;
  // var confirmPasswordObscure = true.obs;

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  // var confirmPasswordController = TextEditingController();

  void onEyeClick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void submit() async {
    if (registerFormKey.currentState!.validate()) {
      await AuthRepo.registerUser(
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        username: usernameController.text,
        password: passwordController.text,
        onSuccess: (user) {
          loading.hide();
          Get.back();
          CustomSnackBar.success(title: "Sign Up successful");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Signup", message: message);
        },
      );
    } else {}
  }
}
