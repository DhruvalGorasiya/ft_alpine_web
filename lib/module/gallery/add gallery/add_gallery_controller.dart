import 'package:ft_chetak_books/module/gallery/gallery%20detail/gallery_detail_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as d;

import '../../../models/get_gallery_model.dart';


class AddGalleryController extends GetxController {
final galleryDetailController = Get.find<GalleryDetailController>();
  RxList<String> verticalList = <String>[].obs;
  RxList<XFile> verticalListTempDemo = <XFile>[].obs;
  RxList<String> horizontalLiat = <String>[].obs;
  RxList<XFile> horizontalTempDemo = <XFile>[].obs;

  Future<String> createGalleryApi(BuildContext context,int? id) async {
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


      formData.fields.add(MapEntry("category_id", "$id"));


      // Add vertical images
      for (var i = 0; i < verticalByte.length; i++) {
        formData.files.add(MapEntry(
            "verticle_image[$i]",
            d.MultipartFile.fromBytes(verticalByte[i], filename: 'vertical_demo_$i.png')
        ));
      }

      // Add horizintal images
      for (var i = 0; i < horizontalByte.length; i++) {
        formData.files.add(MapEntry(
            "horizontal_image[$i]",
            d.MultipartFile.fromBytes(horizontalByte  [i], filename: 'horizontal_image_$i.png')
        ));
      }
      var resp = await callApi(
        dio.post(
          'gallery',
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
      // galleryDetailController.getGalleryApi(id);

      if (resp != null ) {
        galleryDetailController.getGalleryModel.value?.data?.add(Data.fromJson(resp.data['data']));
        galleryDetailController.getGalleryModel.refresh();
        Navigator.pop(context);
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }



  RxBool isLoading = false.obs;
  Future<void> updateGalleryApi(BuildContext context,int?i) async {
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


      // formData.fields.add(MapEntry("category_id", "$id"));


      // Add vertical images
      for (var i = 0; i < verticalByte.length; i++) {
        formData.files.add(MapEntry(
            "verticle_image[$i]",
            d.MultipartFile.fromBytes(verticalByte[i], filename: 'vertical_demo_$i.png')
        ));
      }

      // Add horizintal images
      for (var i = 0; i < horizontalByte.length; i++) {
        formData.files.add(MapEntry(
            "horizontal_image[$i]",
              d.MultipartFile.fromBytes(horizontalByte[i], filename: 'horizontal_image_$i.png')
        ));

      }
      var resp = await callApi(
        dio.post(
          'gallery/$i',
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
      if (resp != null ) {
        isLoading.value = false;
        final int? index =galleryDetailController.getGalleryModel.value?.data?.indexWhere((element) => element.id == i);
        galleryDetailController.getGalleryModel.value?.data?[index??0]= Data.fromJson(resp.data['data']);
        // galleryDetailController.getGalleryApi(i);
        // if(isVertical == true){
        //   galleryDetailController.getGalleryModel.value!.data?[id??0].verticleImage?.clear();
        //   resp.data['data']['verticle_image'].forEach((e){
        //     galleryDetailController.getGalleryModel.value?.data?[id??0].verticleImage?.add(VerticleImage.fromJson(e));
        //   });
        // }
        // else{
        //   galleryDetailController.getGalleryModel.value!.data?[id??0].horizontalImage?.clear();
        //   resp.data['data']['horizontal_image'].forEach((e){
        //     galleryDetailController.getGalleryModel.value?.data?[id??0].horizontalImage?.add(HorizontalImage.fromJson(e));
        //   });
        // }

         galleryDetailController.getGalleryModel.refresh();
        dismissLoader();

        Navigator.pop(context);
      }
       dismissLoader();
    } catch (e) {
      isLoading.value = false;
      dismissLoader();
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
        horizontalLiat.add(image.path);
        horizontalTempDemo.add(imageTemp);

      }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

}
