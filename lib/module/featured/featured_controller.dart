import 'package:ft_chetak_books/models/get_featured_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

class FeaturedController extends GetxController{
  RxList<String?> imageList = <String>[].obs;
  RxBool isLoading = false.obs;
  Rxn<GetFeaturedModel> getFeaturedModel = Rxn<GetFeaturedModel>();
  Future<void> getFeaturedApi() async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "featured",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        getFeaturedModel.value = GetFeaturedModel.fromJson(resp.data);
        // getFeaturedModel.value?.data?.forEach((element) {
        //   imageList.add(element.featuredImaged);
        //
        // });
        // imageList.refresh();
        print(imageList);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
  Future<void> delFeaturedApi(int ? i,BuildContext context) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "featured/${i}",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getFeaturedModel.value?.data?.removeWhere((element) => element.id == i);
        getFeaturedModel.refresh();


      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}