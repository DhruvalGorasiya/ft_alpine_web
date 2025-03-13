import 'package:ft_chetak_books/models/get_studio_image_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

class StudioImageController extends GetxController{
  RxBool isLoading = false.obs;
  Rxn<GetStudioImageModel> getStudioImageModel = Rxn<GetStudioImageModel>();
  Future<void> getStudioImgApi() async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "studio",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        getStudioImageModel.value = GetStudioImageModel.fromJson(resp.data);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
  Future<void> delStudioImgApi(int ? i) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "studio/media/$i",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getStudioImageModel.value?.data?.studioImages?.removeWhere((element) => element.id == i);
        getStudioImageModel.refresh();

        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}