import 'package:ft_chetak_books/components/input_field.dart';
import 'package:ft_chetak_books/module/portfolio/add%20protfolio/add_portfolio_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/get_portfolio_model.dart';

class AddPortfolioScreen extends StatefulWidget {
  String? name;
  int? i;

  // bool? isEdit;
  // int? getId;
  // String? getProjectName;
  // String? getLocation;
  // String? getArea;
  // List<dynamic>? getVerticalList;
  // List<dynamic>? getHorizontalList;
  Data? getPortfolioModel;

  // List? getPortfolioModel;
  AddPortfolioScreen({
    super.key,
    this.name,
    this.i,
    this.getPortfolioModel,
  });

  @override
  State<AddPortfolioScreen> createState() => _AddPortfolioScreenState();
}

class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  final addPortfolioController = Get.put<AddPortfolioController>(AddPortfolioController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.getPortfolioModel != null) {
        addPortfolioController.projectNameController.text = widget.getPortfolioModel?.projectName ?? "";
        addPortfolioController.locationController.text = widget.getPortfolioModel?.location ?? "";
        addPortfolioController.areaController.text = widget.getPortfolioModel?.area ?? "";
        addPortfolioController.horizontalLiat.clear();
        addPortfolioController.horizontalTempDemo.clear();
        addPortfolioController.verticalList.clear();
        addPortfolioController.verticalListTempDemo.clear();


        addPortfolioController.urlController.value = TextEditingController(text: widget.getPortfolioModel?.url ?? "");
        addPortfolioController.urlString.value = widget.getPortfolioModel?.url ?? "";

        widget.getPortfolioModel?.verticleImage?.forEach((element) {
          addPortfolioController.verticalList.add(element.url.toString());
          addPortfolioController.verticalListTempDemo.add(XFile(element.url.toString()));
        });
        widget.getPortfolioModel?.horizontalImage?.forEach((element) {
          addPortfolioController.horizontalLiat.add(element.url.toString());
          addPortfolioController.horizontalTempDemo.add(XFile(element.url.toString()));
        });
        // addPortfolioController.verticalList.add(widget.getVerticalList.toString());
        // print(addPortfolioController.verticalList);
        // addPortfolioController.horizontalLiat.add(widget.getHorizontalList.toString());
      } else {
        addPortfolioController.horizontalLiat.clear();
        addPortfolioController.verticalList.clear();
        addPortfolioController.verticalListTempDemo.clear();
        addPortfolioController.horizontalTempDemo.clear();
        addPortfolioController.projectNameController.clear();
        addPortfolioController.locationController.clear();
        addPortfolioController.areaController.clear();
        addPortfolioController.urlController.value.clear();
        addPortfolioController.urlString.value = "";
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
                "Pages / Portfolio / ${widget.name.toString()}  ",
                style: GoogleFonts.genos().normal20w300g,
              ),
              Text(
                widget.name.toString(),
                style: Responsive.isDesktop(context) ? GoogleFonts.genos().normal28w400 : GoogleFonts.genos().normal22w700,
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
                                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
                              ),
                              const Gap(8),
                              InputField(
                                controller: addPortfolioController.projectNameController,
                                hint: "Enter here",
                                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
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
                                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
                              ),
                              const Gap(8),
                              InputField(
                                controller: addPortfolioController.locationController,
                                hint: "Enter here",
                                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
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
                                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
                              ),
                              const Gap(8),
                              InputField(
                                controller: addPortfolioController.areaController,
                                hint: "Enter here",
                                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
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
                              style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
                            ),
                            const Gap(8),
                            InputField(
                              controller: addPortfolioController.projectNameController,
                              hint: "OPTIMUS 16",
                              hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
                            )
                          ],
                        ),
                        const Gap(18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
                            ),
                            const Gap(8),
                            InputField(
                              controller: addPortfolioController.locationController,
                              hint: "WAGLE ESTATE, THANE",
                              hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
                            )
                          ],
                        ),
                        const Gap(18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Area",
                              style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
                            ),
                            const Gap(8),
                            InputField(
                              controller: addPortfolioController.areaController,
                              hint: "5,00,000 SQ.FT.",
                              hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
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
                    addPortfolioController.urlString.value = val ?? "";
                    setState(() {});
                  },
                  hint: 'Add link',
                  controller: addPortfolioController.urlController.value,
                ),
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
                      addPortfolioController.pickVerticalImage(isVertical: true, isHorizontal: false);
                    },
                    child: Container(
                      width: Responsive.isDesktop(context) ? 211 : MediaQuery.of(context).size.width / 2.3,
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
                            itemCount: addPortfolioController.verticalList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Responsive.isDesktop(context)
                                        ? Image.network(
                                            addPortfolioController.verticalList[index],
                                            fit: BoxFit.cover,
                                            width: 211,
                                            height: 300,
                                          )
                                        : Image.file(
                                            File(addPortfolioController.verticalList[index]),
                                            fit: BoxFit.cover,
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
                                                addPortfolioController.verticalList.removeAt(index);
                                                addPortfolioController.verticalListTempDemo.removeAt(index);
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
                style: GoogleFonts.genos().normal20w300g,
              ),
              const Gap(34),
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
                              addPortfolioController.pickVerticalImage(isVertical: false, isHorizontal: true);
                            },
                            child: Container(
                              height: 250,
                              width: 400,
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
                            height: 250,
                            child: Obx(
                              () => ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: addPortfolioController.horizontalLiat.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(addPortfolioController.horizontalLiat[index]),
                                          fit: BoxFit.fill,
                                        )),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(right: 20, bottom: 20),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [

                                                    GestureDetector(
                                                      onTap: () {
                                                        addPortfolioController.horizontalLiat.removeAt(index);
                                                        addPortfolioController.horizontalTempDemo.removeAt(index);
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
                              addPortfolioController.pickVerticalImage(isVertical: false, isHorizontal: true);
                            },
                            child: Container(
                              height: Responsive.isDesktop(context) ? 250 : 180,
                              width: Responsive.isDesktop(context) ? 400 : 180,
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
                            height: Responsive.isDesktop(context) ? 250 : 180,
                            child: Obx(
                              () => ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: addPortfolioController.horizontalLiat.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Container(
                                        width: Responsive.isDesktop(context) ? 400 : 200,
                                        decoration:BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(File(addPortfolioController.horizontalLiat[index])),
                                              fit: BoxFit.fill,
                                            )
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
                                                        addPortfolioController.horizontalTempDemo.removeAt(index);
                                                        addPortfolioController.horizontalLiat.removeAt(index);
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
                "Ratio- 16:9 / H:638 - W:1134 / File type: PNG-JPG",
                style: GoogleFonts.genos().normal20w300g,
              ),
              const Gap(34),
              CommonAppButton(
                onTap: () {
                  widget.getPortfolioModel != null
                      ? addPortfolioController.updatePortfolioApi(widget.getPortfolioModel?.id, context, widget.i)
                      : addPortfolioController.createPortfolioApi(context, widget.i);
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
