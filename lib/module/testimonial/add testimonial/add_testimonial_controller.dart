
import 'package:ft_chetak_books/module/testimonial/testimonial_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

import '../../../models/get_testimonial_model.dart';

class AddTestimonialController extends GetxController {
  final testimonialController = Get.find<TestimonialController>();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientDesignationController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> createTestimonialApi(BuildContext context) async {
    try {
      isLoading.value = true;
      var queryParameters = {"client_name": clientNameController.text,"client_designation":clientDesignationController.text,"feedback":feedbackController.text};
      showLoader();
      var resp = await callApi(
        dio.post(
          "testimonial",
          data: queryParameters,
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();

        testimonialController.getTestimonialModel.value?.data?.add(Data.fromJson(resp.data['data']));
        testimonialController.getTestimonialModel.refresh();
        Navigator.pop(context);

        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
  Future<void> updateTestimonialApi(BuildContext context,int? i) async {
    try {
      isLoading.value = true;
      var queryParameters = {"client_name": clientNameController.text,"client_designation":clientDesignationController.text,"feedback":feedbackController.text};
      showLoader();
      var resp = await callApi(
        dio.post(
          "testimonial/$i",
          data: queryParameters,
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        final int? index =testimonialController.getTestimonialModel.value?.data?.indexWhere((element) => element.id == i);
        testimonialController.getTestimonialModel.value?.data?[index??0]= Data.fromJson(resp.data['data']);
        testimonialController.getTestimonialModel.refresh();
        Navigator.pop(context);

        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}
