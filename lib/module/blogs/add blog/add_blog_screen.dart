import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../components/input_field.dart';
import '../../../models/get_blog_model.dart';
import 'add_blog_controller.dart';

class AddBlogScreen extends StatefulWidget {
  Data? data;

  AddBlogScreen({super.key, this.data});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final addBlogController = Get.put<AddBlogController>(AddBlogController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.data != null) {
        addBlogController.titleController.text = widget.data?.title ?? "";
        addBlogController.contentController.text = widget.data?.content ?? "";
        addBlogController.file.value = XFile(widget.data?.heroImage ?? "");
        addBlogController.horizontalLiat.clear();
        addBlogController.horizontalTempDemo.clear();
        addBlogController.verticalList.clear();
        addBlogController.verticalListTempDemo.clear();

        widget.data?.verticleImage?.forEach((element) {
          addBlogController.verticalList.add(element.url.toString());
          addBlogController.verticalListTempDemo.add(XFile(element.url.toString()));
        });
        widget.data?.horizontalImage?.forEach((element) {
          addBlogController.horizontalLiat.add(element.url.toString());
          addBlogController.horizontalTempDemo.add(XFile(element.url.toString()));
        });
      } else {
        addBlogController.horizontalLiat.clear();
        addBlogController.horizontalTempDemo.clear();
        addBlogController.verticalList.clear();
        addBlogController.verticalListTempDemo.clear();
        addBlogController.file.value = XFile("");
        addBlogController.titleController.clear();
        addBlogController.contentController.clear();
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
                  child: const Icon(Icons.arrow_back)),
              Text(
                "Pages / Blogs / Add blog",
                style: GoogleFonts.genos().normal20w300g,
              ),
              Text(
                "ADD BLOG",
                style: GoogleFonts.genos().normal28w400,
              ),
              const Gap(34),
              Text(
                "BLOG HERO IMAGE",
                style: GoogleFonts.genos().normal20w400,
              ),
              const Gap(22),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        addBlogController.pickVerticalImage(isFromHero: true, isHorizontal: false, isVertical: false);
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
                    Obx(
                      () => addBlogController.file.value.path.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Responsive.isDesktop(context)
                                      ? getImageView(
                                          finalUrl: addBlogController.file.value.path,
                                          height: 250,
                                          width: 400,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.file(
                                          File(addBlogController.file.value.path),
                                          height: 250,
                                          width: 400,
                                          fit: BoxFit.fill,
                                        ),
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
                                              addBlogController.file.value = XFile("");
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
                            )
                          : const SizedBox(),
                    )
                  ],
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
                      addBlogController.pickVerticalImage(isFromHero: false, isHorizontal: false, isVertical: true);
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
                            itemCount: addBlogController.verticalList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Responsive.isDesktop(context)
                                        ? getImageView(
                                            finalUrl: addBlogController.verticalList[index],
                                            fit: BoxFit.fill,
                                            width: 211,
                                            height: 300,
                                          )
                                        : Image.file(
                                            File(addBlogController.verticalList[index]),
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
                                                addBlogController.verticalList.removeAt(index);
                                                addBlogController.verticalListTempDemo.removeAt(index);

                                                addBlogController.verticalListTempDemo.refresh();
                                                addBlogController.verticalList.refresh();
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
                      addBlogController.pickVerticalImage(isFromHero: false, isHorizontal: true, isVertical: false);
                    },
                    child: Container(
                      height: Responsive.isDesktop(context) ? 250 : 250,
                      width: Responsive.isDesktop(context) ? 400 : 190,
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
                  Obx(
                    () => Expanded(
                      child: SizedBox(
                        height: 250,
                        child: ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: addBlogController.horizontalLiat.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Responsive.isDesktop(context)
                                        ? getImageView(
                                            finalUrl: addBlogController.horizontalLiat[index],
                                            fit: BoxFit.fill,
                                            width: 400,
                                            height: 250,
                                          )
                                        : Image.file(
                                            File(addBlogController.horizontalLiat[index]),
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
                                                addBlogController.horizontalLiat.removeAt(index);
                                                addBlogController.horizontalTempDemo.removeAt(index);
                                                addBlogController.horizontalTempDemo.refresh();
                                                addBlogController.horizontalLiat.refresh();
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
              const Gap(22),
              Text(
                "Blog title",
                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
              ),
              InputField(
                controller: addBlogController.titleController,
                hint: "Architectural Alchemy: Crafting Dreams into Concrete Realities",
                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
              ),
              const Gap(22),
              Text(
                "Content",
                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
              ),
              InputField(
                maxLine: 10,
                controller: addBlogController.contentController,
                hint: "Enter here",
                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
              ),
              const Gap(34),
              CommonAppButton(
                onTap: () {
                  widget.data != null ? addBlogController.updateBlogApi(context, widget.data?.id) : addBlogController.createBlogApi(context);
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
