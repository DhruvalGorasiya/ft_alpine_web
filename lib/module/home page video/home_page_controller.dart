import 'package:dio/dio.dart' as d;
import 'package:ft_chetak_books/models/home_page_video_model.dart';
import 'package:ft_chetak_books/package/config_packages.dart' hide FormData, MultipartFile;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../package/config_packages.dart';

class HomePageController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<HomePageVideoModel> homePageVideoModel = Rxn<HomePageVideoModel>();
  Rx<TextEditingController> urlController = TextEditingController().obs;
  RxString urlString = ''.obs;

  Future<void> createFeaturedApi(String? url, String? id) async {
    try {
      d.FormData formData;
      formData = d.FormData();
      formData.fields.add(MapEntry("url", url ?? ""));

      var resp = await callApi(
        dio.post(
          'home/$id',
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
        urlController.value.clear();
        urlString.value = '';
        controller.loadVideo( resp.data['data']['url']);

      }
    } catch (e) {
      print(e);
    }
  }

  late YoutubePlayerController controller = YoutubePlayerController(
    params: const YoutubePlayerParams(
      showControls: true,
      mute: false,
      showFullscreenButton: true,
      loop: false,
    ),
  );



  Future<void> homePageVideoApiCall() async {
    try {
      isLoading.value = true;
      showLoader();
      var resp = await callApi(
        dio.get(
          EndPoint.homePageVideo,
        ),
      );
      if (resp != null) {
        isLoading.value = false;
        homePageVideoModel.value = HomePageVideoModel.fromJson(resp.data);
        controller.loadVideo( homePageVideoModel.value?.data?[0].url ?? "",);
      }
      dismissLoader();
    } catch (e) {
      isLoading.value = false;

      dismissLoader();
    }
  }
}
