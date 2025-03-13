import 'package:ft_chetak_books/package/config_packages.dart';

import '../../models/get_blog_model.dart';

class BlogDetailController extends GetxController{
  RxList<List<VerticleImage>>? imgList = <List<VerticleImage>>[].obs;
  RxBool isLoading = false.obs;
  Rxn<GetBlogModel> getBlogModel = Rxn<GetBlogModel>();
  Future<void> getBlogApi() async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "blog",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        getBlogModel.value = GetBlogModel.fromJson(resp.data);
        // getBlogModel.value?.data?.forEach((element) {
        //   imgList?.add(element.verticleImage);
        //
        // });
        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
  Future<void> delBlogApi(int ? i) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "blog/$i",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getBlogModel.value?.data?.removeWhere((element) => element.id == i);
        getBlogModel.refresh();

        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }

}
