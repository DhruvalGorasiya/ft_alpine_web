import 'package:ft_chetak_books/module/portfolio/portfolio%20detail/portfolio_detail_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as d;

import '../../../models/get_portfolio_model.dart';

class AddPortfolioController extends GetxController {

  Rx<TextEditingController> urlController = TextEditingController().obs;
  RxString urlString = ''.obs;

  final portfolioDetailController = Get.find<PortfolioDetailController>();
  RxInt? modalIndex;
  TextEditingController projectNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  // Rx<XFile> file = XFile("").obs;
  // Rx<File> tempFile = File("").obs;
  RxList<String> verticalList = <String>[].obs;
  RxList<XFile> verticalListTempDemo = <XFile>[].obs;
  RxList<String> horizontalLiat = <String>[].obs;
  RxList<XFile> horizontalTempDemo = <XFile>[].obs;

  Future<String> createPortfolioApi(BuildContext context,int?i) async {
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
      formData.fields.add(MapEntry("category_id", "$i"));
      formData.fields.add(MapEntry("url", urlString.value));


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
          'portfolio',
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
        Navigator.pop(context);
        portfolioDetailController.getPortfolioApi(i);
      }
      return "";
    } catch (e) {
      print(e);
      return "";
    }
  }
  Future<void> updatePortfolioApi(int? id,BuildContext context,int?i) async {
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
      formData.fields.add(MapEntry("category_id", i.toString()));
      formData.fields.add(MapEntry("url", urlString.value));


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
          'portfolio/$id',
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
        dismissLoader();
        // portfolioDetailController.getPortfolioApi(id);
        final int? index =portfolioDetailController.getPortfolioModel.value?.data?.indexWhere((element) => element.id == id);
        portfolioDetailController.getPortfolioModel.value?.data?[index??0]= Data.fromJson(resp.data['data']);
        portfolioDetailController.getPortfolioModel.refresh();
        Navigator.pop(context);

      }
      // return "";
    } catch (e) {
      print(e);
      // return "";
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
