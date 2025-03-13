
import 'package:ft_chetak_books/models/login_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

import '../../tab/tab_screen.dart';

class LogInController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  RxBool state = false.obs;
  RxBool isLoading = false.obs;
  Rxn<LogInModel> logInModel = Rxn<LogInModel>();
  Future<void> logInApiCall(BuildContext context) async {
    try {
      isLoading.value = true;
      var queryParameters = {"email": emailController.text,"password":passWordController.text};
      showLoader();
      var resp = await callApi(
        dio.post(
          EndPoint.login,
          data: queryParameters,
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        logInModel.value = LogInModel.fromJson(resp.data);
        AppPref().token=logInModel.value?.authorization?.token??"";

        Navigator.of(context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const TabBarScreen()), (Route<dynamic> route) => false);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}