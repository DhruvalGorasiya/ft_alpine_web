import 'package:google_fonts/google_fonts.dart';

import '../../../components/common_function.dart';
import '../../../package/config_packages.dart';
import '../../../utils/common_dialog.dart';
import '../add_ongoing/add_ongoing_screen.dart';
import 'ongoing_detail_controller.dart';

class OnGoingDetailScreen extends StatefulWidget {
  String? name;
  int? id;

  OnGoingDetailScreen({super.key, required this.name, this.id});

  @override
  State<OnGoingDetailScreen> createState() => _OnGoingDetailScreenState();
}

class _OnGoingDetailScreenState extends State<OnGoingDetailScreen> {
  final onGoingDetailController =
      Get.put<OngoingDetailController>(OngoingDetailController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onGoingDetailController.getOngoingApi(widget.id);
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
                        "Pages / Ongoing projects / ${widget.name}  ",
                        style: GoogleFonts.genos().normal20w300g,
                      ),
                      Text(
                        widget.name.toString(),
                        style: Responsive.isDesktop(context) ? GoogleFonts.genos().normal28w400:GoogleFonts.genos().normal22w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(34),
                    ],
                  ),
                ),
                Expanded(
                  flex: Responsive.isDesktop(context) ? 1 : 2,
                  child: CommonAppButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddOnGoingScreen(
                                name: widget.name,
                                modalIndex: widget.id,
                              )));
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
                        (onGoingDetailController.getOngoingModel.value?.data ??
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
                                      builder: (context) => AddOnGoingScreen(
                                        name: widget.name,
                                        modalIndex: widget.id,
                                        getOnGoingModel: onGoingDetailController
                                            .getOngoingModel
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
                                              onGoingDetailController
                                                  .delOngoingApi(
                                                      onGoingDetailController
                                                          .getOngoingModel
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
                        title: Text(
                          onGoingDetailController.getOngoingModel.value
                                  ?.data?[index].projectName ??
                              "",
                          style: GoogleFonts.genos().normal28w700.textColor(
                                AppColor.black,
                              ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  onGoingDetailController
                                          .getOngoingModel
                                          .value
                                          ?.data?[index]
                                          .verticleImage
                                          ?.length ??
                                      0,
                                  (i) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: getImageView(
                                      finalUrl: onGoingDetailController
                                              .getOngoingModel
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
                                  onGoingDetailController
                                          .getOngoingModel
                                          .value
                                          ?.data?[index]
                                          .horizontalImage
                                          ?.length ??
                                      0,
                                  (i) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: getImageView(
                                      finalUrl: onGoingDetailController
                                              .getOngoingModel
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
            //     () => ListView.builder(
            //       itemCount:
            //           (onGoingDetailController.getOngoingModel.value?.data ??
            //                   [])
            //               .length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(top: 34,bottom: 20),
            //           child: Row(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Expanded(
            //                 child: ListView.builder(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   itemCount: (onGoingDetailController.getOngoingModel.value
            //                               ?.data?[index].verticleImage ??
            //                           [])
            //                       .length,
            //                   shrinkWrap: true,
            //                   // scrollDirection: Axis.vertical,
            //                   // gridDelegate:
            //                   //     const SliverGridDelegateWithMaxCrossAxisExtent(
            //                   //   maxCrossAxisExtent: 320,
            //                   //   mainAxisExtent: 342,
            //                   //   crossAxisSpacing: 10,
            //                   //   mainAxisSpacing: 10,
            //                   // ),
            //                   itemBuilder: (BuildContext context, i) {
            //                     return Padding(
            //                       padding: const EdgeInsets.only(bottom: 14),
            //                       child: Column(
            //                         children: [
            //                           Container(
            //                             height: 350,
            //                             width: 250,
            //                             child: Image.network(
            //                               onGoingDetailController.getOngoingModel.value
            //                                       ?.data?[index].verticleImage?[i].url ??
            //                                   "",
            //                               fit: BoxFit.cover,
            //                             ),
            //                           ),
            //                           const Gap(14),
            //                           Row(
            //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //                             children: [
            //                               Text(
            //                                 onGoingDetailController.getOngoingModel.value
            //                                         ?.data?[index].projectName ??
            //                                     "",
            //                                 style: GoogleFonts.genos().normal20w400,
            //                               ),
            //                               Row(
            //                                 children: [
            //                                   GestureDetector(
            //                                     onTap: () {
            //                                       Navigator.of(context).push(
            //                                           MaterialPageRoute(
            //                                               builder: (context) =>
            //                                                   AddOnGoingScreen(
            //                                                     getOngoingModel:
            //                                                         onGoingDetailController
            //                                                             .getOngoingModel,
            //                                                     isEdit: true,
            //                                                     name: widget.name,
            //                                                     modalIndex: widget.id,
            //                                                     getVerticalList: [onGoingDetailController.getOngoingModel.value?.data?[index].verticleImage],
            //                                                     getHorizontalList: [onGoingDetailController.getOngoingModel.value?.data?[index].horizontalImage],
            //                                                     getProjectName: onGoingDetailController.getOngoingModel.value?.data?[index].projectName,
            //                                                     getLocation: onGoingDetailController.getOngoingModel.value?.data?[index].location,
            //                                                     getArea: onGoingDetailController.getOngoingModel.value?.data?[index].area,
            //                                                   )));
            //                                     },
            //                                     child: Container(
            //                                       decoration: BoxDecoration(
            //                                         border: Border.all(
            //                                             color: AppColor.accentColor),
            //                                       ),
            //                                       child: Padding(
            //                                         padding: const EdgeInsets.all(6.0),
            //                                         child: Image.asset(
            //                                           AppImage.editIcon,
            //                                           height: 16,
            //                                           width: 16,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                   const Gap(8),
            //                                   GestureDetector(
            //                                     onTap: () {
            //                                       showDialog(
            //                                           context: context,
            //                                           builder: (BuildContext context) =>
            //                                               CommonDialog(
            //                                                 cancelOnTap: () {
            //                                                   Navigator.pop(context);
            //                                                 },
            //                                                 deleteOnTap: () {
            //                                                   onGoingDetailController
            //                                                       .delOngoingApi(
            //                                                           index, context,widget.id);
            //                                                   Navigator.pop(context);
            //                                                 },
            //                                               ));
            //                                     },
            //                                     child: Container(
            //                                       decoration: const BoxDecoration(
            //                                           color: AppColor.redColor),
            //                                       child: Padding(
            //                                         padding: const EdgeInsets.all(6.0),
            //                                         child: Image.asset(
            //                                           AppImage.deleteIcon,
            //                                           height: 16,
            //                                           width: 16,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ],
            //                               )
            //                             ],
            //                           )
            //                         ],
            //                       ),
            //                     );
            //                   },
            //                 ),
            //               ),
            //               Gap(14),
            //               Expanded(
            //                 child: ListView.builder(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   itemCount: (onGoingDetailController.getOngoingModel.value
            //                               ?.data?[index].horizontalImage ??
            //                           [])
            //                       .length,
            //                   shrinkWrap: true,
            //                   // scrollDirection: Axis.vertical,
            //                   // gridDelegate:
            //                   //     const SliverGridDelegateWithMaxCrossAxisExtent(
            //                   //   maxCrossAxisExtent: 320,
            //                   //   mainAxisExtent: 342,
            //                   //   crossAxisSpacing: 10,
            //                   //   mainAxisSpacing: 10,
            //                   // ),
            //                   itemBuilder: (BuildContext context, i) {
            //                     return Padding(
            //                       padding: const EdgeInsets.only(bottom: 14),
            //                       child: Column(
            //                         children: [
            //                           SizedBox(
            //                             height: 250,
            //                             width: 400,
            //                             child: Image.network(
            //                               onGoingDetailController.getOngoingModel.value
            //                                       ?.data?[index].horizontalImage?[i].url ??
            //                                   "",
            //                               fit: BoxFit.cover,
            //                             ),
            //                           ),
            //                           const Gap(14),
            //                           Row(
            //                             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                             children: [
            //                               Text(
            //                                 onGoingDetailController.getOngoingModel.value
            //                                         ?.data?[index].projectName ??
            //                                     "",
            //                                 style: GoogleFonts.genos().normal20w400,
            //                               ),
            //                               Gap(5),
            //                               Row(
            //                                 children: [
            //                                   GestureDetector(
            //                                     onTap: () {
            //                                       Navigator.of(context).push(
            //                                           MaterialPageRoute(
            //                                               builder: (context) =>
            //                                                   AddOnGoingScreen(
            //                                                     getOngoingModel:
            //                                                         onGoingDetailController
            //                                                             .getOngoingModel,
            //                                                     isEdit: true,
            //                                                     name: widget.name,
            //                                                     modalIndex: widget.id,
            //                                                     getVerticalList: [onGoingDetailController.getOngoingModel.value?.data?[index].verticleImage],
            //                                                     getHorizontalList: [onGoingDetailController.getOngoingModel.value?.data?[index].horizontalImage],
            //                                                     getProjectName: onGoingDetailController.getOngoingModel.value?.data?[index].projectName,
            //                                                     getLocation: onGoingDetailController.getOngoingModel.value?.data?[index].location,
            //                                                     getArea: onGoingDetailController.getOngoingModel.value?.data?[index].area,
            //                                                   )));
            //                                     },
            //                                     child: Container(
            //                                       decoration: BoxDecoration(
            //                                         border: Border.all(
            //                                             color: AppColor.accentColor),
            //                                       ),
            //                                       child: Padding(
            //                                         padding: const EdgeInsets.all(6.0),
            //                                         child: Image.asset(
            //                                           AppImage.editIcon,
            //                                           height: 16,
            //                                           width: 16,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                   const Gap(8),
            //                                   GestureDetector(
            //                                     onTap: () {
            //                                       showDialog(
            //                                           context: context,
            //                                           builder: (BuildContext context) =>
            //                                               CommonDialog(
            //                                                 cancelOnTap: () {
            //                                                   Navigator.pop(context);
            //                                                 },
            //                                                 deleteOnTap: () {
            //                                                   onGoingDetailController
            //                                                       .delOngoingApi(
            //                                                           index, context,widget.id);
            //                                                   Navigator.pop(context);
            //                                                 },
            //                                               ));
            //                                     },
            //                                     child: Container(
            //                                       decoration: const BoxDecoration(
            //                                           color: AppColor.redColor),
            //                                       child: Padding(
            //                                         padding: const EdgeInsets.all(6.0),
            //                                         child: Image.asset(
            //                                           AppImage.deleteIcon,
            //                                           height: 16,
            //                                           width: 16,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ],
            //                               )
            //                             ],
            //                           )
            //                         ],
            //                       ),
            //                     );
            //                   },
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
