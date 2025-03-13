import 'package:ft_chetak_books/package/config_packages.dart';

import '../../../models/get_ongoing_model.dart';


class OngoingDetailController extends GetxController{
  RxBool isLoading = false.obs;
  Rxn<GetOngoingModel> getOngoingModel = Rxn<GetOngoingModel>();
  Future<void> getOngoingApi(int? i) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "ongoingproject/${i}",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        getOngoingModel.value = GetOngoingModel.fromJson(resp.data);
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnGoingDetailScreen(name: name[i],)));


      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
  Future<void> delOngoingApi(int ? i,BuildContext context,int?id) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "ongoingproject/${i}",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getOngoingApi(id);


        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}