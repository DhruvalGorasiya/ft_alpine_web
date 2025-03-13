import 'package:ft_chetak_books/module/studio%20images/studio_image_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as d;

import '../../../models/get_studio_image_model.dart';

class AddStudioImagesController extends GetxController {
  final studioImageController = Get.find<StudioImageController>();
  RxList<String> verticalList = <String>[].obs;
  RxList<XFile> verticalListTempDemo = <XFile>[].obs;
  Rx<XFile> file = XFile("").obs;
  Rx<File> tempFile = File("").obs;

  Future<String> createStudioImageApi(BuildContext context) async {
    try {
      List<List<int>> verticalByte = [];
      for (var element in verticalListTempDemo) {
        List<int> temp = await element.readAsBytes();
        verticalByte.add(temp);
      }


      d.FormData formData;
      formData = d.FormData();

      // Add vertical images
      for (var i = 0; i < verticalByte.length; i++) {
        formData.files.add(MapEntry(
            "studio_image[$i]",
            d.MultipartFile.fromBytes(verticalByte[i], filename: 'studio_image_$i.png')
        ));
      }

      var resp = await callApi(
        dio.post(
          'studio',
          data: formData,
          options: d.Options(
            headers: {
              'Accept': '*/*',
              'Content-Type': 'application/json',
              if (AppPref().token.isNotEmpty) 'Authorization': 'Bearer ${AppPref().token}',
            },
          ),
        ),
      );
      if (resp != null) {
        studioImageController.getStudioImageModel.value?.data?.studioImages?.clear();
        resp.data['data']['studio_images'].forEach((e){
          studioImageController.getStudioImageModel.value?.data?.studioImages?.add(StudioImages.fromJson(e));
        });

        studioImageController.getStudioImageModel.refresh();
        Navigator.pop(context);

      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }
  Future<String> updateStudioImageApi(int?id,BuildContext context) async {
    try {
      List<List<int>> verticalByte = [];
      for (var element in verticalListTempDemo) {
        List<int> temp = await element.readAsBytes();
        verticalByte.add(temp);
      }


      d.FormData formData;
      formData = d.FormData();

      // Add vertical images
      for (var i = 0; i < verticalByte.length; i++) {
        formData.files.add(MapEntry(
            "image",
            d.MultipartFile.fromBytes(verticalByte[i], filename: 'studio_image_$i.png')
        ));
      }

      var resp = await callApi(
        dio.post(
          'studio/media/$id',
          data: formData,
          options: d.Options(
            headers: {
              'Accept': '*/*',
              'Content-Type': 'application/json',
              if (AppPref().token.isNotEmpty) 'Authorization': 'Bearer ${AppPref().token}',
            },
          ),
        ),
      );

      if (resp != null) {
       studioImageController.getStudioImgApi();
        Navigator.pop(context);
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future pickVerticalImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = XFile(image.path);
        verticalList.add(image.path);
        verticalListTempDemo.add(imageTemp);
        file.value = XFile(image.path);

    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
