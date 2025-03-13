import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/module/studio_images/studio_image_controller.dart';

import '../../../package/config_packages.dart';
import '../../utils/common_dialog.dart';
import 'add_studio_images/add_studio_image_screen.dart';

class StudioImagesScreen extends StatefulWidget {
  const StudioImagesScreen({super.key});

  @override
  State<StudioImagesScreen> createState() => _StudioImagesScreenState();
}

class _StudioImagesScreenState extends State<StudioImagesScreen> {
  final studioImageController = Get.put<StudioImageController>(StudioImageController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      studioImageController.getStudioImgApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 32, top: 32, right: 32),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pages / Studio images",
                        style: const TextStyle().normal20w300g,
                      ),
                      Text(
                        "STUDIO IMAGES LIST",
                        style: Responsive.isDesktop(context) ?  TextStyle().normal28w400:TextStyle().normal22w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(34),
                    ],
                  ),
                ),
                Expanded(
                  flex: Responsive.isDesktop(context) ? 1 : 3,
                  child: CommonAppButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudioImageScreen()));
                    },
                    check: true,
                    width: 331,
                    icon: Icons.add,
                    text: "ADD STUDIO IMAGES",
                    buttonType: ButtonType.enable,
                  ),
                )
              ],
            ),
            const Gap(34),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount: (studioImageController.getStudioImageModel.value?.data?.studioImages ?? []).length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(mainAxisExtent: 280, maxCrossAxisExtent: 600),
                  // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //   maxCrossAxisExtent: 320,
                  //   mainAxisExtent: 342,
                  //   crossAxisSpacing: 10,
                  //   mainAxisSpacing: 10,
                  //
                  // ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 35, right: 35),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        fit: StackFit.expand,
                        children: [
                          getImageView(
                            finalUrl: studioImageController.getStudioImageModel.value?.data?.studioImages?[index].url ?? "",
                            fit: BoxFit.fill,
                            height: 280,
                            width: 500,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AddStudioImageScreen(
                                          studioImages: studioImageController.getStudioImageModel.value?.data?.studioImages?[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.accentColor),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.asset(
                                        AppImage.editIcon,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(8),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => CommonDialog(
                                              cancelOnTap: () {
                                                Navigator.pop(context);
                                              },
                                              deleteOnTap: () {
                                                Navigator.pop(context);
                                                studioImageController.delStudioImgApi(
                                                  studioImageController.getStudioImageModel.value?.data?.studioImages?[index].id,
                                                );
                                              },
                                            ));
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(color: AppColor.redColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image.asset(
                                        AppImage.deleteIcon,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
