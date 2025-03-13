import 'package:ft_chetak_books/components/input_field.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/common_function.dart';
import '../../../models/get_featured_model.dart';
import 'add_featured_controller.dart';

class AddFeaturedScreen extends StatefulWidget {
  final Data? data;

  const AddFeaturedScreen({super.key, this.data});

  @override
  State<AddFeaturedScreen> createState() => _AddFeaturedScreenState();
}

class _AddFeaturedScreenState extends State<AddFeaturedScreen> {
  final addFeaturedController = Get.put<AddFeaturedController>(AddFeaturedController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.data != null) {
        addFeaturedController.file.value = XFile(widget.data?.featuredImaged ?? "");
        addFeaturedController.projectNameController.text = widget.data?.thumbnailDescription ?? "";
      } else {
        addFeaturedController.projectNameController.text = "";
        addFeaturedController.file.value = XFile("");
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
                "Pages / Studio images / Add Featured",
                style: const TextStyle().normal20w300g,
              ),
              Text(
                "ADD FEATURED",
                style: const TextStyle().normal28w400,
              ),
              const Gap(34),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Featured thumbnail description",
                    style: const TextStyle().normal18w500g.textColor(AppColor.grayColor),
                  ),
                  const Gap(8),
                  InputField(
                    controller: addFeaturedController.projectNameController,
                    hint: "Enter here",
                    hintStyle: const TextStyle().normal18w400g.textColor(AppColor.black),
                  )
                ],
              ),
              const Gap(8),
              Text(
                "You can only add 51 characters",
                style: const TextStyle().normal14w500g.textColor(AppColor.grayColor),
              ),
              const Gap(22),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        addFeaturedController.pickVerticalImage(isFromHero: true);
                      },
                      child: Container(
                        width: 245,
                        height: 360,
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
                            Obx(
                              () => Text(
                                addFeaturedController.file.value.path.isEmpty ? "Upload file" : "Edit file",
                                style: const TextStyle().normal16w500g,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Obx(
                        () => addFeaturedController.file.value.path.isEmpty
                            ? const SizedBox()
                            : Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Obx(() => Responsive.isDesktop(context)
                                      ? getImageView(
                                          finalUrl: addFeaturedController.file.value.path,
                                          fit: BoxFit.fill,
                                          width: 245,
                                          height: 360,
                                        )
                                      : Image.file(
                                          File(addFeaturedController.file.value.path),
                                          fit: BoxFit.fill,
                                          width: 245,
                                          height: 360,
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
                                              addFeaturedController.file.value = XFile("");
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
                      ),
                    )
                  ],
                ),
              ),
              const Gap(34),
              CommonAppButton(
                onTap: () async {
                  widget.data != null
                      ? await addFeaturedController.editFeaturedApi(widget.data?.id, context)
                      : await addFeaturedController.createFeaturedApi(context);
                },
                width: 290,
                text: "UPLOAD",
                buttonType: ButtonType.enable,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
