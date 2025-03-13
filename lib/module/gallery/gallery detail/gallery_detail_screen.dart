import 'package:ft_chetak_books/components/common_function.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../package/config_packages.dart';
import '../../../utils/common_dialog.dart';
import '../add gallery/add_gallery_screen.dart';
import 'gallery_detail_controller.dart';

class GalleryDetailScreen extends StatefulWidget {
  String? name;
  int? id;

  GalleryDetailScreen({super.key, required this.name, this.id});

  @override
  State<GalleryDetailScreen> createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen> {
  final galleryDetailController =
      Get.put<GalleryDetailController>(GalleryDetailController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      galleryDetailController.getGalleryApi(widget.id);
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
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Gap(10),
                      Text(
                        "Pages / Gallery / ${widget.name}  ",
                        style: GoogleFonts.genos().normal20w300g,
                      ),
                      Text(
                        widget.name.toString(),
                        style: Responsive.isDesktop(context) ? GoogleFonts.genos().normal28w400:GoogleFonts.genos().normal22w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(34),
                    ],
                  ),
                ),
                Expanded(
                  flex: Responsive.isDesktop(context) ? 1 : 2,
                  child: CommonAppButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddGalleryScreen(
                            name: widget.name,
                            id: widget.id,
                          ),
                        ),
                      );
                    },
                    check: true,
                    width: 331,
                    icon: Icons.add,
                    text: "Add new Project",
                    buttonType: ButtonType.enable,
                  ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity, // Set width to occupy available space

                child: Obx(
                  () => ListView.builder(
                    itemCount:
                        (galleryDetailController.getGalleryModel.value?.data ??
                                [])
                            .length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        titleAlignment: ListTileTitleAlignment.titleHeight,
                        trailing: Container(
                          width: 68,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AddGalleryScreen(
                                        id: widget.id,
                                        name: widget.name,
                                        data: galleryDetailController
                                            .getGalleryModel
                                            .value
                                            ?.data?[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColor.accentColor),
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
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColor.accentColor),
                                  ),
                                  height: 30,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CommonDialog(
                                            cancelOnTap: () {
                                              Navigator.pop(context);
                                            },
                                            deleteOnTap: () {
                                              Navigator.pop(context);
                                              galleryDetailController
                                                  .delGalleryApi(
                                                      galleryDetailController
                                                          .getGalleryModel
                                                          .value
                                                          ?.data?[index]
                                                          .id,
                                                      context,
                                                      widget.id);
                                            },
                                          ));
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.redColor),
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
                        // title: Text(
                        //   galleryDetailController.getGalleryModel.value?.data?[index].projectName ?? "",
                        //   style: GoogleFonts.genos().normal28w700.textColor(
                        //     AppColor.black,
                        //   ),
                        // ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  galleryDetailController
                                          .getGalleryModel
                                          .value
                                          ?.data?[index]
                                          .verticleImage
                                          ?.length ??
                                      0,
                                  (i) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: getImageView(
                                      finalUrl: galleryDetailController
                                              .getGalleryModel
                                              .value
                                              ?.data?[index]
                                              .verticleImage?[i]
                                              .url ??
                                          "",
                                      height: 350,
                                      width: 250,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  galleryDetailController
                                          .getGalleryModel
                                          .value
                                          ?.data?[index]
                                          .horizontalImage
                                          ?.length ??
                                      0,
                                  (i) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: getImageView(
                                      finalUrl: galleryDetailController
                                              .getGalleryModel
                                              .value
                                              ?.data?[index]
                                              .horizontalImage?[i]
                                              .url ??
                                          "",
                                      height: 250,
                                      width: 400,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Obx(
            //     () => GridView.builder(
            //       itemCount: (galleryDetailController.getGalleryModel.value?.data ?? []).length,
            //       scrollDirection: Axis.vertical,
            //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(mainAxisExtent: 280, maxCrossAxisExtent: 600),
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(bottom: 35, right: 35),
            //           child: Stack(
            //             alignment: Alignment.bottomRight,
            //             fit: StackFit.expand,
            //             children: [
            //               getImageView(
            //                 finalUrl: galleryDetailController.getGalleryModel.value?.data?[index].horizontalImage?.first.url ?? "",
            //                 fit: BoxFit.fill,
            //                 height: 280,
            //                 width: 500,
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(bottom: 20, right: 20),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   crossAxisAlignment: CrossAxisAlignment.end,
            //                   children: [
            //                     GestureDetector(
            //                       onTap: () {
            //                         // Navigator.of(context).push(
            //                         //   MaterialPageRoute(
            //                         //     builder: (context) => AddGalleryScreen(
            //                         //       id: widget.id,
            //                         //       name: widget.name,
            //                         //       verticalImage: galleryDetailController.getGalleryModel.value?.data?[index].verticleImage?[i],
            //                         //     ),
            //                         //   ),
            //                         // );
            //                       },
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           border: Border.all(color: AppColor.accentColor),
            //                         ),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(6.0),
            //                           child: Image.asset(
            //                             AppImage.editIcon,
            //                             height: 16,
            //                             width: 16,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     const Gap(8),
            //                     GestureDetector(
            //                       onTap: () {
            //                         showDialog(
            //                           context: context,
            //                           builder: (BuildContext context) => CommonDialog(
            //                             cancelOnTap: () {
            //                               Navigator.pop(context);
            //                             },
            //                             deleteOnTap: () {
            //                               Navigator.pop(context);
            //                               galleryDetailController.delGalleryApi(
            //                                   galleryDetailController.getGalleryModel.value?.data?[index].id, context, widget.id);
            //                             },
            //                           ),
            //                         );
            //                       },
            //                       child: Container(
            //                         decoration: const BoxDecoration(color: AppColor.redColor),
            //                         child: Padding(
            //                           padding: const EdgeInsets.all(6.0),
            //                           child: Image.asset(
            //                             AppImage.deleteIcon,
            //                             height: 16,
            //                             width: 16,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

////
// Gap(14),
// Expanded(
// flex: 2,
// child: Obx(
// () => ListView.builder(
// physics: const NeverScrollableScrollPhysics(),
// itemCount: (galleryDetailController.getGalleryModel.value?.data?[index].horizontalImage ?? []).length,
// shrinkWrap: true,
// // scrollDirection: Axis.vertical,
// // gridDelegate:
// //     const SliverGridDelegateWithMaxCrossAxisExtent(
// //   maxCrossAxisExtent: 320,
// //   mainAxisExtent: 342,
// //   crossAxisSpacing: 10,
// //   mainAxisSpacing: 10,
// // ),
// itemBuilder: (BuildContext context, i2) {
// return Padding(
// padding: const EdgeInsets.only(bottom: 14),
// child: Container(
// height: 350,
// width: 250,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(
// galleryDetailController.getGalleryModel.value?.data?[index].horizontalImage?[i2].url ?? ""),
// fit: BoxFit.fill)),
// child: Padding(
// padding: const EdgeInsets.only(bottom: 20, right: 20),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// GestureDetector(
// onTap: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => AddGalleryScreen(
// id: widget.id,
// name: widget.name,
// horizontalImage:
// galleryDetailController.getGalleryModel.value?.data?[index].horizontalImage?[i2],
// )));
// },
// child: Container(
// decoration: BoxDecoration(
// border: Border.all(color: AppColor.accentColor),
// ),
// child: Padding(
// padding: const EdgeInsets.all(6.0),
// child: Image.asset(
// AppImage.editIcon,
// height: 16,
// width: 16,
// ),
// ),
// ),
// ),
// const Gap(8),
// GestureDetector(
// onTap: () {
// showDialog(
// context: context,
// builder: (BuildContext context) => CommonDialog(
// cancelOnTap: () {
// Navigator.pop(context);
// },
// deleteOnTap: () {
// Navigator.pop(context);
// galleryDetailController.delGalleryApi(
// galleryDetailController.getGalleryModel.value?.data?[index].horizontalImage?[i2].id,
// context,
// widget.id);
// },
// ));
// },
// child: Container(
// decoration: const BoxDecoration(color: AppColor.redColor),
// child: Padding(
// padding: const EdgeInsets.all(6.0),
// child: Image.asset(
// AppImage.deleteIcon,
// height: 16,
// width: 16,
// ),
// ),
// ),
// ),
// ],
// ),
// )),
// );
// },
// ),
// ),
// ),
