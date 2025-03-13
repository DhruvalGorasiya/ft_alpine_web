import 'package:ft_chetak_books/module/featured/featured_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as d;

import '../../../models/get_featured_model.dart';


class AddFeaturedController extends GetxController {
 final featuredController = Get.find<FeaturedController>();
  TextEditingController projectNameController = TextEditingController();

  Rx<XFile> file = XFile("").obs;
  Rx<File> tempFile = File("").obs;

  Future<String> createFeaturedApi(BuildContext context) async {
    try {
      List<int> heroImageByte = await file.value.readAsBytes();


      d.FormData formData;
      formData = d.FormData();

      formData.fields.add(MapEntry("thumbnail_description", projectNameController.text));

      // Add hero image
      formData.files.add(MapEntry(
          "featured_image",
          d.MultipartFile.fromBytes(heroImageByte, filename: tempFile.value.toString())
      ));


      var resp = await callApi(
        dio.post(
          'featured',
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
      // featuredController.getFeaturedApi();
      // Navigator.pop(context);
      if (resp != null ) {

       featuredController.getFeaturedModel.value?.data?.add(Data.fromJson(resp.data['data']));
       featuredController.getFeaturedModel.refresh();
       Navigator.pop(context);

        // return resp.data["fileUrl"];
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }
  Future<String> editFeaturedApi(int? id,BuildContext context) async {
    try {
      List<int> heroImageByte = await file.value.readAsBytes();


      d.FormData formData;
      formData = d.FormData();

      formData.fields.add(MapEntry("thumbnail_description", projectNameController.text));

      // Add hero image
      formData.files.add(MapEntry(
          "featured_image",
          d.MultipartFile.fromBytes(heroImageByte, filename: tempFile.value.toString())
      ));


      var resp = await callApi(
        dio.post(
          'featured/$id',
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
      // featuredController.getFeaturedApi();
      // Navigator.pop(context);
      if (resp != null) {
        final int? index =featuredController.getFeaturedModel.value?.data?.indexWhere((element) => element.id == id);
        featuredController.getFeaturedModel.value?.data?[index??0]= Data.fromJson(resp.data['data']);
        featuredController.getFeaturedModel.refresh();
        Navigator.pop(context);
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future pickVerticalImage({
    required bool isFromHero,
  }) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = XFile(image.path);
      if (isFromHero == true) {
        file.value = imageTemp;
        tempFile.value = File(image.path);
      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }


}
