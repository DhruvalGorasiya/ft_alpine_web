import 'package:flutter/cupertino.dart';
import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/models/category_model.dart';
import 'package:ft_chetak_books/module/tab/tab_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

import 'gallery detail/gallery_detail_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final tabController = Get.find<TabBarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 32, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pages / Gallery",
              style: const TextStyle().normal20w300g,
            ),
            Text(
              "GALLERY CATEGORY LIST",
              style: const TextStyle().normal28w400,
            ),
            const Gap(34),
            Expanded(
              child: GridView.builder(
                itemCount: tabController.categoryModel.value?.data?.length,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisExtent: 342,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Data? data = tabController.categoryModel.value?.data?[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GalleryDetailScreen(
                            name:data?.name,
                            id: data?.id,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 34, bottom: 34),
                      child: SizedBox(
                        height: 303,
                        child: Stack(
                          // alignment: Alignment.bottomRight,

                          fit: StackFit.expand,
                          children: [
                            getImageView(
                              finalUrl:
                              data?.url ??
                                  "",
                              fit: BoxFit.fill,
                              height: 280,
                              width: 500,

                            ),
                            Container(
                              color: AppColor.black.withOpacity(0.45),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,

                              child: Padding(
                                padding: const EdgeInsets.only(right: 20,bottom: 20,left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data?.name??"",
                                      style: const TextStyle().normal14w400.textColor(AppColor.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
