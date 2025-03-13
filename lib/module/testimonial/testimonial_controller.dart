import 'package:ft_chetak_books/models/get_testimonial_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

class TestimonialController extends GetxController{
  RxBool isLoading = false.obs;
  Rxn<GetTestimonialModel> getTestimonialModel = Rxn<GetTestimonialModel>();
  Future<void> getTestimonialApi() async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "testimonial",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getTestimonialModel.value = GetTestimonialModel.fromJson(resp.data);


        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }

  Future<void> delTestimonialApi(int ? i,BuildContext context) async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.delete(
          "testimonial/${i}",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getTestimonialModel.value?.data?.removeWhere((element) => element.id == i);
        getTestimonialModel.refresh();
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}