import 'package:flutter/material.dart';
import 'package:ft_chetak_books/module/banner/add/add_banner_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/banner_modcel.dart';

class AddbannerScreen extends StatefulWidget {
  Data? bannerModel;

  AddbannerScreen({super.key, this.bannerModel});

  @override
  State<AddbannerScreen> createState() => _AddbannerScreenState();
}

class _AddbannerScreenState extends State<AddbannerScreen> {
  final addBannerController = Get.put<AddBannerController>(AddBannerController());

  @override
  void initState() {
    if (widget.bannerModel != null) {
      addBannerController.horizontalLiat.clear();
      addBannerController.horizontalTempDemo.clear();
      addBannerController.selectedString.value = widget.bannerModel?.page ?? "";
      widget.bannerModel?.images?.forEach((element) {
        addBannerController.horizontalLiat.add(element.url.toString());
        addBannerController.horizontalTempDemo.add(XFile(element.url.toString()));
      });
    } else {
      addBannerController.horizontalLiat.clear();
      addBannerController.horizontalTempDemo.clear();
      addBannerController.selectedString = "home".obs;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            const Gap(10),
            Text(
              "Banners / Add Banners",
              style: GoogleFonts.genos().normal28w400,
            ),
            const Gap(20),
            Text(
              "Page",
              style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
            ),
            Gap(10),
            Obx(
              () => Container(
                width: Responsive.isMobile(context) ? 200 : MediaQuery.of(context).size.width / 2.5,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColor.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      focusColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 0,
                      value: addBannerController.selectedString.value,
                      items: addBannerController.pages.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e ?? ""),
                        );
                      }).toList(),
                      onChanged: (val) {
                        addBannerController.selectedString.value = val.toString();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Gap(20),
            Text(
              "ADD HORIZONTAL IMAGES",
              style: GoogleFonts.genos().normal20w400,
            ),
            const Gap(22),
            Responsive.isDesktop(context)
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            addBannerController.pickVerticalImage(isVertical: false, isHorizontal: true);
                          },
                          child: Container(
                            height: 360,
                            width: 245,
                            decoration: BoxDecoration(border: Border.all(color: AppColor.black)),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImage.uploadImg,
                                  height: 25.5,
                                ),
                                const Gap(15),
                                Text(
                                  "Upload photos",
                                  style: GoogleFonts.genos().normal16w500g,
                                ),
                              ],
                            )),
                          )),
                      const Gap(15),
                      Expanded(
                        child: SizedBox(
                          height: 360,
                          child: Obx(
                            () => ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: addBannerController.horizontalLiat.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                      width: 245,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(addBannerController.horizontalLiat[index]),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right: 20, bottom: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  // Container(
                                                  //   decoration: BoxDecoration(
                                                  //     border: Border.all(color: AppColor.accentColor),
                                                  //   ),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.all(6.0),
                                                  //     child: Image.asset(
                                                  //       AppImage.editIcon,
                                                  //       height: 16,
                                                  //       width: 16,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(left: 8, right: 8),
                                                  //   child: Container(
                                                  //     decoration: BoxDecoration(
                                                  //       border: Border.all(color: AppColor.white),
                                                  //     ),
                                                  //     height: 30,
                                                  //   ),
                                                  // ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      addBannerController.horizontalLiat.removeAt(index);
                                                      addBannerController.horizontalTempDemo.removeAt(index);
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
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            addBannerController.pickVerticalImage(isVertical: false, isHorizontal: true);
                          },
                          child: Container(
                            height: Responsive.isDesktop(context) ? 360 : 250,
                            width: Responsive.isDesktop(context) ? 245 : 180,
                            decoration: BoxDecoration(border: Border.all(color: AppColor.black)),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImage.uploadImg,
                                  height: 25.5,
                                ),
                                const Gap(15),
                                Text(
                                  "Upload photos",
                                  style: GoogleFonts.genos().normal16w500g,
                                ),
                              ],
                            )),
                          )),
                      const Gap(15),
                      Expanded(
                        child: SizedBox(
                          height: 360,
                          child: Obx(
                            () => ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: addBannerController.horizontalLiat.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                      width: 245,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(File(addBannerController.horizontalLiat[index])),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(right: 20, bottom: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  // Container(
                                                  //   decoration: BoxDecoration(
                                                  //     border: Border.all(color: AppColor.accentColor),
                                                  //   ),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.all(6.0),
                                                  //     child: Image.asset(
                                                  //       AppImage.editIcon,
                                                  //       height: 16,
                                                  //       width: 16,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(left: 8, right: 8),
                                                  //   child: Container(
                                                  //     decoration: BoxDecoration(
                                                  //       border: Border.all(color: AppColor.white),
                                                  //     ),
                                                  //     height: 30,
                                                  //   ),
                                                  // ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      addBannerController.horizontalTempDemo.removeAt(index);
                                                      addBannerController.horizontalLiat.removeAt(index);
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
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      )
                    ],
                  ),
            Gap(25),
            const Gap(34),
            CommonAppButton(
              onTap: () async {
                widget.bannerModel != null
                    ? await addBannerController.updateBannersApi(
                        context,
                        widget.bannerModel?.id ?? 0,
                      )
                    : await addBannerController.createBannersApi(context);
              },
              width: 290,
              text: "UPLOAD",
              buttonType: ButtonType.enable,
            )
          ],
        ),
      ),
    );
  }
}
