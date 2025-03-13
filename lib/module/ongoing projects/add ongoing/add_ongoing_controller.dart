import 'package:dio/dio.dart' as d;
import 'package:ft_chetak_books/module/ongoing%20projects/ongoing%20detail/ongoing_detail_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart'
    hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';

import '../../../models/get_ongoing_model.dart';

class AddOnGoingController extends GetxController {
  Rx<TextEditingController> urlController = TextEditingController().obs;
  RxString urlString = ''.obs;


  final onGoingDetailController = Get.find<OngoingDetailController>();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  RxList<String> verticalList = <String>[].obs;
  RxList<XFile> verticalListTempDemo = <XFile>[].obs;
  RxList<String> horizontalList = <String>[].obs;
  RxList<XFile> horizontalTempDemo = <XFile>[].obs;

  Future<String> createOngoingApi(BuildContext context, int? id) async {
    try {
      List<List<int>> verticalByte = [];
      List<List<int>> horizontalByte = [];
      for (var element in verticalListTempDemo) {
        List<int> temp = await element.readAsBytes();
        verticalByte.add(temp);
      }
      for (var element in horizontalTempDemo) {
        List<int> temp = await element.readAsBytes();
        horizontalByte.add(temp);
      }

      d.FormData formData;
      formData = d.FormData();

      formData.fields.add(MapEntry("project_name", projectNameController.text));
      formData.fields.add(MapEntry("location", locationController.text));
      formData.fields.add(MapEntry("area", areaController.text));
      formData.fields.add(MapEntry("category_id", "$id"));
      formData.fields.add(MapEntry("url", urlString.value));

      // Add vertical images
      for (var i = 0; i < verticalByte.length; i++) {
        formData.files.add(MapEntry(
            "verticle_image[$i]",
            d.MultipartFile.fromBytes(verticalByte[i],
                filename: 'vertical_demo_$i.png')));
      }

      // Add horizintal images
      for (var i = 0; i < horizontalByte.length; i++) {
        formData.files.add(MapEntry(
            "horizontal_image[$i]",
            d.MultipartFile.fromBytes(horizontalByte[i],
                filename: 'horizontal_image_$i.png')));
      }
      var resp = await callApi(
        dio.post(
          'ongoingproject',
          data: formData,
          options: d.Options(
            headers: {
              'Accept': '*/*',
              'Content-Type': 'application/json',
              if (AppPref().token.isNotEmpty)
                'Authorization': 'Bearer ${AppPref().token}',
            },
          ),
        ),
      );

      if (resp != null) {
        onGoingDetailController.getOngoingApi(id);
        Navigator.pop(context);
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<void> updateOngoingApi(BuildContext context, int? id, int? i) async {
    try {
      List<List<int>> verticalByte = [];
      List<List<int>> horizontalByte = [];
      for (var element in verticalListTempDemo) {
        List<int> temp = await element.readAsBytes();
        verticalByte.add(temp);
      }
      for (var element in horizontalTempDemo) {
        List<int> temp = await element.readAsBytes();
        horizontalByte.add(temp);
      }

      d.FormData formData;
      formData = d.FormData();

      formData.fields.add(MapEntry("project_name", projectNameController.text));
      formData.fields.add(MapEntry("location", locationController.text));
      formData.fields.add(MapEntry("area", areaController.text));
      formData.fields.add(MapEntry("category_id", "$id"));
      formData.fields.add(MapEntry("url", urlString.value));

      // Add vertical images
      for (var i = 0; i < verticalByte.length; i++) {
        formData.files.add(MapEntry(
            "verticle_image[$i]",
            d.MultipartFile.fromBytes(verticalByte[i],
                filename: 'vertical_demo_$i.png')));
      }

      // Add horizintal images
      for (var i = 0; i < horizontalByte.length; i++) {
        formData.files.add(MapEntry(
            "horizontal_image[$i]",
            d.MultipartFile.fromBytes(horizontalByte[i],
                filename: 'horizontal_image_$i.png')));
      }
      var resp = await callApi(
        dio.post(
          'ongoingproject/$i',
          data: formData,
          options: d.Options(
            headers: {
              'Accept': '*/*',
              'Content-Type': 'application/json',
              if (AppPref().token.isNotEmpty)
                'Authorization': 'Bearer ${AppPref().token}',
            },
          ),
        ),
      );

      if (resp != null) {
        dismissLoader();
        // onGoingDetailController.getOngoingApi(id);
        final int? index = onGoingDetailController.getOngoingModel.value?.data
            ?.indexWhere((element) => element.id == i);
        onGoingDetailController.getOngoingModel.value?.data?[index ?? 0] =
            Data.fromJson(resp.data['data']);
        onGoingDetailController.getOngoingModel.refresh();
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  Future pickVerticalImage({
    required bool isVertical,
    required bool isHorizontal,
  }) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = XFile(image.path);
      if (isVertical) {
        verticalList.add(image.path);
        verticalListTempDemo.add(imageTemp);
      } else if (isHorizontal) {
        horizontalList.add(image.path);
        horizontalTempDemo.add(imageTemp);
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
