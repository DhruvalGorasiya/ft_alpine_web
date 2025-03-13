import 'package:ft_chetak_books/models/get_portfolio_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

class PortfolioDetailController extends GetxController {
  RxList<VerticleImage> verticalImgList = <VerticleImage>[].obs;
  RxBool isLoading = false.obs;
  Rxn<GetPortfolioModel> getPortfolioModel = Rxn<GetPortfolioModel>();

  Future<void> getPortfolioApi(int? i) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "portfolio/$i",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        getPortfolioModel.value = GetPortfolioModel.fromJson(resp.data);

        print(verticalImgList);
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }

  Future<void> delPortfolioApi(int? i, BuildContext context,int?id) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "portfolio/${i}",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getPortfolioApi(id);
        print(resp);
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}
