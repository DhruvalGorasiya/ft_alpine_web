import 'package:ft_chetak_books/components/input_field.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/common_function.dart';
import '../../../models/get_ongoing_model.dart';
import 'add_ongoing_controller.dart';

class AddOnGoingScreen extends StatefulWidget {
  String? name;
  int? modalIndex;
  Data? getOnGoingModel;

  AddOnGoingScreen({
    super.key,
    this.name,
    this.getOnGoingModel,
    this.modalIndex,
  });

  @override
  State<AddOnGoingScreen> createState() => _AddOnGoingScreenState();
}

class _AddOnGoingScreenState extends State<AddOnGoingScreen> {
  final addOnGoingController = Get.put<AddOnGoingController>(AddOnGoingController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.getOnGoingModel != null) {
        addOnGoingController.projectNameController.clear();
        addOnGoingController.locationController.clear();
        addOnGoingController.areaController.clear();
        addOnGoingController.horizontalList.clear();
        addOnGoingController.horizontalTempDemo.clear();
        addOnGoingController.verticalList.clear();
        addOnGoingController.verticalListTempDemo.clear();

        addOnGoingController.projectNameController.text = widget.getOnGoingModel?.projectName ?? "";
        addOnGoingController.locationController.text = widget.getOnGoingModel?.location ?? "";
        addOnGoingController.areaController.text = widget.getOnGoingModel?.area ?? "";

        addOnGoingController.urlController.value = TextEditingController(text: widget.getOnGoingModel?.url ?? "");
        addOnGoingController.urlString.value = widget.getOnGoingModel?.url ?? "";

        widget.getOnGoingModel?.verticleImage?.forEach((element) {
          addOnGoingController.verticalList.add(element.url.toString());
          addOnGoingController.verticalListTempDemo.add(XFile(element.url.toString()));
        });
        widget.getOnGoingModel?.horizontalImage?.forEach((element) {
          addOnGoingController.horizontalList.add(element.url.toString());
          addOnGoingController.horizontalTempDemo.add(XFile(element.url.toString()));
        });
      } else {
        addOnGoingController.horizontalList.clear();
        addOnGoingController.horizontalTempDemo.clear();
        addOnGoingController.verticalList.clear();
        addOnGoingController.verticalListTempDemo.clear();
        addOnGoingController.projectNameController.clear();
        addOnGoingController.locationController.clear();
        addOnGoingController.areaController.clear();
        addOnGoingController.urlController.value.clear();
        addOnGoingController.urlString.value = "";
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
              Text(
                "Pages / Ongoing projects / ${widget.name.toString()}  ",
                style: const TextStyle().normal20w300g,
              ),
              Text(
                widget.name.toString(),
                style: Responsive.isDesktop(context) ? TextStyle().normal28w400 : TextStyle().normal22w700,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(34),
              Responsive.isDesktop(context)
                  ? Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Project name",
                                style: const TextStyle().normal18w500g.textColor(AppColor.grayColor),
                              ),
                              const Gap(8),
                              InputField(
                                controller: addOnGoingController.projectNameController,
                                hint: "Enter here",
                                hintStyle: const TextStyle().normal18w400g.textColor(AppColor.black),
                              )
                            ],
                          ),
                        ),
                        const Gap(18),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: const TextStyle().normal18w500g.textColor(AppColor.grayColor),
                              ),
                              const Gap(8),
                              InputField(
                                controller: addOnGoingController.locationController,
                                hint: "Enter here",
                                hintStyle: const TextStyle().normal18w400g.textColor(AppColor.black),
                              )
                            ],
                          ),
                        ),
                        const Gap(18),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Area",
                                style: const TextStyle().normal18w500g.textColor(AppColor.grayColor),
                              ),
                              const Gap(8),
                              InputField(
                                controller: addOnGoingController.areaController,
                                hint: "Enter here",
                                hintStyle: const TextStyle().normal18w400g.textColor(AppColor.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Project name",
                              style: const TextStyle().normal18w500g.textColor(AppColor.grayColor),
                            ),
                            const Gap(8),
                            InputField(
                              controller: addOnGoingController.projectNameController,
                              hint: "Enter here",
                              hintStyle: const TextStyle().normal18w400g.textColor(AppColor.black),
                            )
                          ],
                        ),
                        const Gap(18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: const TextStyle().normal18w500g.textColor(AppColor.grayColor),
                            ),
                            const Gap(8),
                            InputField(
                              controller: addOnGoingController.locationController,
                              hint: "Enter here",
                              hintStyle: const TextStyle().normal18w400g.textColor(AppColor.black),
                            )
                          ],
                        ),
                        const Gap(18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Area",
                              style: const TextStyle().normal18w500g.textColor(AppColor.grayColor),
                            ),
                            const Gap(8),
                            InputField(
                              controller: addOnGoingController.areaController,
                              hint: "Enter here",
                              hintStyle: const TextStyle().normal18w400g.textColor(AppColor.black),
                            )
                          ],
                        ),
                      ],
                    ),
              const Gap(34),
              Obx(
                () => InputField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppImage.linkIcon,
                      height: 25.5,
                    ),
                  ),
                  onChange: (val) {
                    addOnGoingController.urlString.value = val ?? "";
                    setState(() {});
                  },
                  hint: 'Add link',
                  controller: addOnGoingController.urlController.value,
                ),
              ),
              const Gap(34),
              Text(
                "ADD VERTICAL IMAGES",
                style: const TextStyle().normal20w400,
              ),
              const Gap(22),
              Responsive.isDesktop(context)
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addOnGoingController.pickVerticalImage(isVertical: true, isHorizontal: false);
                          },
                          child: Container(
                            width: 211,
                            height: 300,
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
                                  style: const TextStyle().normal16w500g,
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
                                  itemCount: addOnGoingController.verticalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          getImageView(
                                            finalUrl: addOnGoingController.verticalList[index],
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
                                                      addOnGoingController.verticalList.removeAt(index);
                                                      addOnGoingController.verticalListTempDemo.removeAt(index);
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
                    )
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addOnGoingController.pickVerticalImage(isVertical: true, isHorizontal: false);
                          },
                          child: Container(
                            width: 150,
                            height: 300,
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
                                  style: const TextStyle().normal16w500g,
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
                                  itemCount: addOnGoingController.verticalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Image.file(
                                            File(addOnGoingController.verticalList[index]),
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
                                                      addOnGoingController.verticalList.removeAt(index);
                                                      addOnGoingController.verticalListTempDemo.removeAt(index);
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
                "Ratio- 16:9 / H:638 - W:450 / File type: PNG-JPG",
                style: const TextStyle().normal20w300g,
              ),
              const Gap(34),
              Text(
                "ADD HORIZONTAL IMAGES",
                style: const TextStyle().normal20w400,
              ),
              const Gap(22),
              Responsive.isDesktop(context)
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addOnGoingController.pickVerticalImage(isVertical: false, isHorizontal: true);
                          },
                          child: Container(
                            height: Responsive.isDesktop(context) ? 250 : 200,
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
                                  style: const TextStyle().normal16w500g,
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
                                  itemCount: addOnGoingController.horizontalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          getImageView(
                                            finalUrl: addOnGoingController.horizontalList[index],
                                            fit: BoxFit.fill,
                                            width: 400,
                                            height: 250,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10, bottom: 10),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Row(
                                                children: [

                                                  GestureDetector(
                                                    onTap: () {
                                                      addOnGoingController.horizontalList.removeAt(index);
                                                      addOnGoingController.horizontalTempDemo.removeAt(index);
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
                    )
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addOnGoingController.pickVerticalImage(isVertical: false, isHorizontal: true);
                          },
                          child: Container(
                            height: 250,
                            width: 200,
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
                                  style: const TextStyle().normal16w500g,
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
                                  itemCount: addOnGoingController.horizontalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Image.file(
                                            File(addOnGoingController.horizontalList[index]),
                                            fit: BoxFit.fill,
                                            width: 400,
                                            height: 250,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10, bottom: 10),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Row(
                                                children: [
                                                  Container(
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
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: AppColor.white),
                                                      ),
                                                      height: 30,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      addOnGoingController.horizontalList.removeAt(index);
                                                      addOnGoingController.horizontalTempDemo.removeAt(index);
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
                "Ratio- 16:9 / H:638 - W:1134 / File type: PNG-JPG",
                style: const TextStyle().normal20w300g,
              ),
              const Gap(34),
              CommonAppButton(
                onTap: () {
                  widget.getOnGoingModel != null
                      ? addOnGoingController.updateOngoingApi(context, widget.modalIndex, widget.getOnGoingModel?.id)
                      : addOnGoingController.createOngoingApi(context, widget.modalIndex);
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
