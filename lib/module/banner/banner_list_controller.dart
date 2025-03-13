import 'package:ft_chetak_books/models/banner_modcel.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

class BannerController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<BannerModel> bannerModel = Rxn<BannerModel>();
  Future<void> getBannerApi() async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "banner",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        bannerModel.value = BannerModel.fromJson(resp.data);
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }


  Future<void> delPortfolioApi(BuildContext context,int?id) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "banner/$id",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        bannerModel.value?.data?.removeWhere((element) => element.id==id);
        bannerModel.refresh();
        dismissLoader();

        // print(resp);
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }

}
