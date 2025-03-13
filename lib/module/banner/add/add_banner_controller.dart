import 'package:ft_chetak_books/models/banner_modcel.dart';
import 'package:ft_chetak_books/module/banner/banner_list_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as d;

class AddBannerController extends GetxController{
  final bannerController = Get.find<BannerController>();
  
  RxList pages = [
    "home",
    "services",
    "contact",
  ].obs;
  RxString selectedString = "home".obs;

  RxList<String> horizontalLiat = <String>[].obs;
  RxList<XFile> horizontalTempDemo = <XFile>[].obs;

  Future<String> createBannersApi(BuildContext context,) async {
    try {
      List<List<int>> horizontalByte = [];
      for (var element in horizontalTempDemo) {
        List<int> temp = await element.readAsBytes();
        horizontalByte.add(temp);
      }

      d.FormData formData;
      formData = d.FormData();

      formData.fields.add(MapEntry("page", selectedString.value));


      for (var i = 0; i < horizontalByte.length; i++) {
        formData.files.add(MapEntry(
            "images[$i]",
            d.MultipartFile.fromBytes(horizontalByte[i], filename: 'images$i.png')
        ));
      }
      var resp = await callApi(
        dio.post(
          'banner',
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

      if (resp != null  ) {
        bannerController.bannerModel.value?.data?.add(Data.fromJson(resp.data['data']));
        bannerController.bannerModel.refresh();
        Navigator.pop(context);
        // portfolioDetailController.getPortfolioApi(i);
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }
  Future<String> updateBannersApi(BuildContext context,int?id,) async {
    try {
      List<List<int>> horizontalByte = [];
      for (var element in horizontalTempDemo) {
        List<int> temp = await element.readAsBytes();
        horizontalByte.add(temp);
      }

      d.FormData formData;
      formData = d.FormData();

      formData.fields.add(MapEntry("page", selectedString.value));


      for (var i = 0; i < horizontalByte.length; i++) {
        formData.files.add(MapEntry(
            "images[$i]",
            d.MultipartFile.fromBytes(horizontalByte[i], filename: 'images$i.png')
        ));
      }
      var resp = await callApi(
        dio.post(
          'banner/$id',
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

      if (resp != null  ) {
        await bannerController.getBannerApi();
        Navigator.pop(context);
        // portfolioDetailController.getPortfolioApi(i);
      }
      return "";
    } catch (e) {
      print(e);
      return "";
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
      // if (isVertical) {
      //   verticalList.add(image.path);
      //   verticalListTempDemo.add(imageTemp);
      // } else if (isHorizontal) {
        horizontalLiat.add(image.path);
        horizontalTempDemo.add(imageTemp);

      // }
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
}