import 'package:ft_chetak_books/package/config_packages.dart';

import '../../tab/tab_screen.dart';

class CreateNewPasswordController extends GetxController{
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPassWordController = TextEditingController();

  RxBool isLoading = false.obs;
  Future<void> forgetPasswordApiCall(BuildContext context,String?email) async {
    try {
      isLoading.value = true;
       var queryParameters = {"email": email,"password":passWordController.text,"password_confirmation":confirmPassWordController.text};
      showLoader();
      var resp = await callApi(
        dio.post(
          EndPoint.resetPassword,
          data: queryParameters,
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TabBarScreen()));

        print(resp);

      }
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}