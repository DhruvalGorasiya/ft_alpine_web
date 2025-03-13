import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/common_function.dart';
import '../../../models/get_studio_image_model.dart';
import 'add_studio_image_controller.dart';

class AddStudioImageScreen extends StatefulWidget {
  final StudioImages? studioImages;

  const AddStudioImageScreen({super.key, this.studioImages});

  @override
  State<AddStudioImageScreen> createState() => _AddStudioImageScreenState();
}

class _AddStudioImageScreenState extends State<AddStudioImageScreen> {
  final addStudioImagesController = Get.put<AddStudioImagesController>(AddStudioImagesController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.studioImages != null) {
        addStudioImagesController.verticalList.clear();
        addStudioImagesController.file.value = XFile("");
        addStudioImagesController.file.value = XFile(widget.studioImages?.url ?? "");
      } else {
        addStudioImagesController.verticalList.clear();
        addStudioImagesController.verticalListTempDemo.clear();
        addStudioImagesController.tempFile = File("").obs;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              Gap(10),
              Text(
                "Pages / Studio images / Add Studio images",
                style: GoogleFonts.genos().normal20w300g,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "ADD STUDIO IMAGES",
                style: Responsive.isDesktop(context) ? GoogleFonts.genos().normal28w400 : GoogleFonts.genos().normal22w700,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(34),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      addStudioImagesController.pickVerticalImage();
                    },
                    child: Container(
                      width: Responsive.isDesktop(context) ? 500 : 180,
                      height: Responsive.isDesktop(context) ? 280 : 280,
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
                    ),
                  ),
                  const Gap(15),
                  widget.studioImages == null
                      ? Expanded(
                          child: SizedBox(
                            height: 280,
                            child: Obx(
                              () => ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: addStudioImagesController.verticalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Responsive.isDesktop(context)
                                              ? getImageView(
                                                  finalUrl: addStudioImagesController.verticalList[index],
                                                  fit: BoxFit.fill,
                                                  width: 500,
                                                  height: 280,
                                                )
                                              : Image.file(
                                                  File(addStudioImagesController.verticalList[index]),
                                                  fit: BoxFit.fill,
                                                  width: 500,
                                                  height: 280,
                                                ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10, bottom: 10),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Row(
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
                                                      addStudioImagesController.verticalList.removeAt(index);
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        )
                      : Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Obx(() => getImageView(
                                  finalUrl: addStudioImagesController.file.value.path,
                                  fit: BoxFit.fill,
                                  width: 500,
                                  height: 280,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, bottom: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
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
                                        addStudioImagesController.file.value = XFile("");
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
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              const Gap(34),
              Text(
                "Ratio- 16:9 / H:590 - W:1042 / File type: PNG-JPG",
                style: GoogleFonts.genos().normal20w300g,
              ),
              const Gap(34),
              CommonAppButton(
                onTap: () {
                  widget.studioImages != null
                      ? addStudioImagesController.updateStudioImageApi(widget.studioImages?.id, context)
                      : addStudioImagesController.createStudioImageApi(context);
                },
                width: 290,
                text: "UPLOAD",
                buttonType: ButtonType.enable,
              )
            ],
          ),
        ),
      ),
    );
  }
}
