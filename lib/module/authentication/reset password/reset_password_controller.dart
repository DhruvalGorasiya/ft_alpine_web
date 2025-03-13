import 'package:ft_chetak_books/package/config_packages.dart';

import '../check your mail/check_mail_screen.dart';

class ResetPasswordController extends GetxController{
  TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> forgetPasswordApiCall(BuildContext context) async {
    try {
      isLoading.value = true;
      var queryParameters = {"email": emailController.text};
      showLoader();
      var resp = await callApi(
        dio.post(
          EndPoint.forgetPassword,
          data: queryParameters,
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  CheckMailScreen(email: emailController.text,)));
        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}