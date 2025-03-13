import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:ft_chetak_books/package/screen_packages.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'home_page_controller.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final homePageController = Get.put<HomePageController>(HomePageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await homePageController.homePageVideoApiCall();
    });
  }

  @override
  void dispose() {
    homePageController.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 32, left: 32, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pages / Home page video",
              style: const TextStyle().normal20w300g,
            ),
            const Gap(8),
            Text(
              "HOME PAGE VIDEO",
              style: const TextStyle().normal28w400,
            ),
            const Gap(16),
            Text(
              "Video Ratio- 16:9",
              style: const TextStyle().normal20w300g,
            ),
            const Gap(20),
            Obx(
                ()=> InputField(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImage.linkIcon,
                    height: 25.5,
                  ),
                ),
                onChange: (val) {
                  homePageController.urlString.value = val??"";
                  setState(() {

                  });
                },
                hint: 'Add link',
                controller: homePageController.urlController.value,
              ),
            ),
            const Gap(34),
            Obx(
              () => CommonAppButton(
                onTap: () async {
                  await homePageController.createFeaturedApi(homePageController.urlController.value.text, 1.toString());
                },
                width: 331,
                text: "UPLOAD",
                buttonType: homePageController.urlString.value.isEmpty ? ButtonType.disable : ButtonType.enable,
              ),
            ),
            const Gap(20),
            SizedBox(
              width: 350,
              height: 200,
              child: YoutubePlayer(
                controller: homePageController.controller,
                // aspectRatio:  4/ 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
