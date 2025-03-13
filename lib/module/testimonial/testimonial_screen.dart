import 'package:ft_chetak_books/module/testimonial/testimonial_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../package/config_packages.dart';
import '../../utils/common_dialog.dart';
import 'add testimonial/add_testimonial_screen.dart';

class TestimonialScreen extends StatefulWidget {
  const TestimonialScreen({super.key});

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  final testimonialController =
      Get.put<TestimonialController>(TestimonialController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      testimonialController.getTestimonialApi();
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
                      Text(
                        "Pages / Testimonials",
                        style: GoogleFonts.genos().normal20w300g,
                      ),
                      Text(
                        "TESTIMONIAL LIST",
                        style: Responsive.isDesktop(context) ?  GoogleFonts.genos().normal28w400:GoogleFonts.genos().normal22w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(34),
                    ],
                  ),
                ),
                Expanded(
                  flex: Responsive.isDesktop(context)?1:2,
                  child: CommonAppButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddTestimonialScreen()));
                    },
                    check: true,
                    width: 331,
                    icon: Icons.add,
                    text: "Add Testimonial",
                    buttonType: ButtonType.enable,
                  ),
                )
              ],
            ),
            const Gap(34),
            Expanded(
              child: Obx(
                () => GridView.builder(
                  itemCount:
                      (testimonialController.getTestimonialModel.value?.data ??
                              [])
                          .length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 320,
                    mainAxisExtent: 342,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 392,
                          width: 504,
                          decoration: const BoxDecoration(
                            color: AppColor.black,
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 24, left: 24, right: 24, bottom: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonialController.getTestimonialModel
                                            .value?.data?[index].clientName ??
                                        "",
                                    style: GoogleFonts.genos()
                                        .normal18w400
                                        .textColor(AppColor.white),
                                  ),
                                  Text(
                                    testimonialController
                                            .getTestimonialModel
                                            .value
                                            ?.data?[index]
                                            .clientDesignation ??
                                        "",
                                    style: GoogleFonts.genos()
                                        .normal20w300g
                                        .textColor(AppColor.white),
                                  ),
                                  const Gap(10),
                                  Text(
                                    testimonialController.getTestimonialModel
                                            .value?.data?[index].feedback ??
                                        "",
                                    style: GoogleFonts.genos()
                                        .normal20w300g
                                        .textColor(AppColor.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24, bottom: 24),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddTestimonialScreen(
                                                  data: testimonialController
                                                      .getTestimonialModel
                                                      .value
                                                      ?.data?[index],
                                                )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.accentColor),
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
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.white),
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
                                                testimonialController.delTestimonialApi(
                                                    testimonialController
                                                        .getTestimonialModel
                                                        .value
                                                        ?.data?[index]
                                                        .id,context);
                                              },
                                            ));

                                  },
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
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
