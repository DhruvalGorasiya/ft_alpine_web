import 'package:ft_chetak_books/module/blogs/blog_detail_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as d;

import '../../../models/get_blog_model.dart';

class AddBlogController extends GetxController {
  final blogDetailController = Get.find<BlogDetailController>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  Rx<XFile> file = XFile("").obs;
  // Rx<File> tempFile = File("").obs;
  RxList<String> verticalList = <String>[].obs;
  RxList<XFile> verticalListTempDemo = <XFile>[].obs;
  RxList<String> horizontalLiat = <String>[].obs;
  RxList<XFile> horizontalTempDemo = <XFile>[].obs;
  RxBool isLoading = false.obs;

  Future<void> createBlogApi(BuildContext context) async {
    try {
      isLoading.value = true;
      List<int> heroImageByte = await file.value.readAsBytes();
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

      formData.fields.add(MapEntry("title", titleController.text));
      formData.fields.add(MapEntry("content", contentController.text));

      // Add hero image
      formData.files.add(MapEntry(
          "hero_image",
          d.MultipartFile.fromBytes(heroImageByte, filename: 'demo.png')
      ));
      

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
          'blog',
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
        isLoading.value = false;
        dismissLoader();

        // blogDetailController.getBlogModel.value?.data?.clear();
        //   blogDetailController.getBlogModel.value?.data?.add(Data.fromJson(resp.data['data']));
        // blogDetailController.getBlogModel.refresh();
         blogDetailController.getBlogApi();

        Navigator.pop(context);

      }
      dismissLoader();
    } catch (e) {
      print(e);
      isLoading.value = false;

      dismissLoader();
    }
  }
  Future<void> updateBlogApi(BuildContext context,int?i) async {
    try {
      List<int> heroImageByte = await file.value.readAsBytes();
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

      formData.fields.add(MapEntry("title", titleController.text));
      formData.fields.add(MapEntry("content", contentController.text));

      // Add hero image
      formData.files.add(MapEntry(
          "hero_image",
          d.MultipartFile.fromBytes(heroImageByte, filename: 'demo.png')
      ));

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
          'blog/$i',
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
        final int? index = blogDetailController.getBlogModel.value?.data?.indexWhere((element) => element.id == i);
        blogDetailController.getBlogModel.value?.data?[index??0]= Data.fromJson(resp.data['data']);
        blogDetailController.getBlogModel.refresh();
        Navigator.pop(context);


      }
    } catch (e) {
      print(e);
    }
  }

  Future pickVerticalImage({
    required bool isFromHero,
    required bool isVertical,
    required bool isHorizontal,
  }) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = XFile(image.path);
      if (isFromHero == true) {
        file.value = imageTemp;
      } else if (isVertical) {
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
