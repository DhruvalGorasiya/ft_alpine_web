import 'package:ft_chetak_books/models/get_by_the_number_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

class ByTheNumberController extends GetxController {
  TextEditingController projectAreaController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController ongoingProjectAreaController = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<GetByTheNumberModel> getByTheNumberModel = Rxn<GetByTheNumberModel>();

  Future<void> updateByTheNumberApi(int?id) async {
    try {
      isLoading.value = true;
      var queryParameters = {"complete_project_area": projectAreaController.text,"experience":experienceController.text,"ongoing_project_area":ongoingProjectAreaController.text};
      showLoader();
      var resp = await callApi(
        dio.post(
          "byTheNumber/$id",
          data: queryParameters,
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        final int? index =getByTheNumberModel.value?.data?.indexWhere((element) => element.id == id);
        getByTheNumberModel.value?.data?[index??0]= Data.fromJson(resp.data['data']);
        getByTheNumberModel.refresh();

        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
  Future<void> getByTheNumberApi() async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          "byTheNumber",
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        dismissLoader();
        getByTheNumberModel.value = GetByTheNumberModel.fromJson(resp.data);
        getByTheNumberModel.value?.data?.forEach((element) {
          projectAreaController.text = element.completeProjectArea??"";
          experienceController.text = element.experience??"";
          ongoingProjectAreaController.text = element.ongoingProjectArea??"";
        });


        print(resp);

      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}
