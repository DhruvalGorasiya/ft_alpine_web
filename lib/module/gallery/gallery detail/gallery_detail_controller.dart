import 'package:ft_chetak_books/models/get_gallery_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

class GalleryDetailController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<GetGalleryModel> getGalleryModel = Rxn<GetGalleryModel>();

  Future<void> getGalleryApi(int? i) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "gallery/$i",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        getGalleryModel.value = GetGalleryModel.fromJson(resp.data);
        // getPortfolioModel.value?.data?.forEach((element) {
        //   verticalImgList.add(element.verticleImage as VerticleImage);
        //
        // });
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }

  Future<void> delGalleryApi(int? i, BuildContext context, int? id) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "gallery/$i",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        await getGalleryApi(id);
        print(resp);
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;
      Navigator.pop(context);
      dismissLoader();
    }
  }
}
