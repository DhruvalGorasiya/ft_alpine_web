import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'add_gallery_controller.dart';
import '../../../models/get_gallery_model.dart';

class AddGalleryScreen extends StatefulWidget {
  final Data? data;
  String? name;
  int? id;

  AddGalleryScreen({super.key, this.name, this.id, this.data});

  @override
  State<AddGalleryScreen> createState() => _AddGalleryScreenState();
}

class _AddGalleryScreenState extends State<AddGalleryScreen> {
  final addGalleryController = Get.put<AddGalleryController>(AddGalleryController());

  @override
  void initState() {
    if (widget.data != null) {
      addGalleryController.horizontalLiat.clear();
      addGalleryController.horizontalTempDemo.clear();
      addGalleryController.verticalList.clear();
      addGalleryController.verticalListTempDemo.clear();

      widget.data?.verticleImage?.forEach((element) {
        addGalleryController.verticalList.add(element.url.toString());
        addGalleryController.verticalListTempDemo.add(XFile(element.url.toString()));
      });
      widget.data?.horizontalImage?.forEach((element) {
        addGalleryController.horizontalLiat.add(element.url.toString());
        addGalleryController.horizontalTempDemo.add(XFile(element.url.toString()));
      });
    } else {
      addGalleryController.horizontalLiat.clear();
      addGalleryController.horizontalTempDemo.clear();
      addGalleryController.verticalList.clear();
      addGalleryController.verticalListTempDemo.clear();
    }
    // if (widget.verticalImage != null || widget.horizontalImage != null) {
    //   addGalleryController.file.value = XFile("");
    //   addGalleryController.file.value = widget.verticalImage != null
    //       ? XFile(widget.verticalImage?.url ?? "")
    //       : XFile(widget.horizontalImage?.url ?? "");
    //   print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    // }

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
                    child: const Icon(Icons.arrow_back)),
                Gap(10),
                Text(
                  "Pages / Gallery / ${widget.name.toString()}  ",
                  style: GoogleFonts.genos().normal20w300g,
                ),
                Text(
                  widget.name.toString(),
                  style: Responsive.isDesktop(context) ? GoogleFonts.genos().normal28w400 : GoogleFonts.genos().normal22w700,
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(34),
                Text(
                  "ADD VERTICAL IMAGES",
                  style: GoogleFonts.genos().normal20w400,
                ),
                const Gap(22),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        addGalleryController.pickVerticalImage(
                          isVertical: true,
                          isHorizontal: false,
                        );
                      },
                      child: Container(
                        width: Responsive.isDesktop(context) ? 211 : 150,
                        height: Responsive.isDesktop(context) ? 300 : 300,
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
                    Expanded(
                      child: SizedBox(
                        height: 300,
                        child: Obx(
                          () => ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: addGalleryController.verticalList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Responsive.isDesktop(context)
                                          ? getImageView(
                                              finalUrl: addGalleryController.verticalList[index],
                                              fit: BoxFit.fill,
                                              width: 211,
                                              height: 300,
                                            )
                                          : Image.file(
                                              File(addGalleryController.verticalList[index]),
                                              fit: BoxFit.fill,
                                              width: 211,
                                              height: 300,
                                            ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Row(
                                            children: [

                                              GestureDetector(
                                                onTap: () {
                                                  addGalleryController.verticalList.removeAt(index);
                                                  addGalleryController.verticalListTempDemo.removeAt(index);
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
                  ],
                ),
                Text(
                  "Ratio- 16:9 / H:442 - W:248 / File type: PNG-JPG",
                  style: GoogleFonts.genos().normal20w300g,
                ),
                const Gap(34),
                Text(
                  "ADD HORIZONTAL IMAGES",
                  style: GoogleFonts.genos().normal20w400,
                ),
                const Gap(22),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        addGalleryController.pickVerticalImage(
                          isVertical: false,
                          isHorizontal: true,
                        );
                      },
                      child: Container(
                        height: Responsive.isDesktop(context) ? 250 : 250,
                        width: Responsive.isDesktop(context) ? 400 : 200,
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
                    Expanded(
                      child: SizedBox(
                        height: 250,
                        child: Obx(
                          () => ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: addGalleryController.horizontalLiat.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    width: 400,
                                    decoration: Responsive.isDesktop(context)
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(addGalleryController.horizontalLiat[index]),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(File(addGalleryController.horizontalLiat[index])),
                                              fit: BoxFit.cover,
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
                                                    addGalleryController.horizontalLiat.removeAt(index);
                                                    addGalleryController.horizontalTempDemo.removeAt(index);
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
                Text(
                  "Ratio- 16:9 / H:442 - W:788 / File type: PNG-JPG",
                  style: GoogleFonts.genos().normal20w300g,
                ),
                const Gap(34),
                CommonAppButton(
                  onTap: () {
                    widget.data != null
                        ? addGalleryController.updateGalleryApi(context, widget.data?.id)
                        : addGalleryController.createGalleryApi(context, widget.id);
                  },
                  width: 290,
                  text: "UPLOAD",
                  buttonType: ButtonType.enable,
                )
              ],
            )),
      ),
    );
  }
}
