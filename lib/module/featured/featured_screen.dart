import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/module/featured/featured_controller.dart';
import '../../../package/config_packages.dart';
import '../../utils/common_dialog.dart';
import 'add featured/add_featured_screen.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  final featuredController = Get.put<FeaturedController>(FeaturedController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      featuredController.getFeaturedApi();
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
                  flex: Responsive.isDesktop(context) ?2:1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pages / Featured",
                        style: const TextStyle().normal20w300g,
                      ),
                      Text(
                        "FEATURED LIST",
                        style: Responsive.isDesktop(context) ? TextStyle().normal28w400:TextStyle().normal22w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(34),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CommonAppButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddFeaturedScreen()));
                    },
                    check: true,
                    width: 300,
                    icon: Icons.add,
                    text: "ADD FEATURED",
                    buttonType: ButtonType.enable,
                  ),
                )
              ],
            ),
            const Gap(34),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount: (featuredController.getFeaturedModel.value?.data ?? []).length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 320,
                    mainAxisExtent: 342,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                            height: 250,
                            width: 400,
                            child: getImageView(
                              finalUrl: featuredController.getFeaturedModel.value?.data?[index].featuredImaged ?? "",
                              fit: BoxFit.fill,
                            )),
                        const Gap(14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                featuredController.getFeaturedModel.value?.data?[index].thumbnailDescription ?? "",
                                style: const TextStyle().normal20w400,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => AddFeaturedScreen(
                                              data: featuredController.getFeaturedModel.value?.data?[index],
                                            )));
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
                                                featuredController.delFeaturedApi(
                                                    featuredController.getFeaturedModel.value?.data?[index].id, context);
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
                            )
                          ],
                        )
                      ],
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
