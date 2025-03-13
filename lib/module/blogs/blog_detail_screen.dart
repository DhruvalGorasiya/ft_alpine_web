import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/module/blogs/blog_detail_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../package/config_packages.dart';
import '../../utils/common_dialog.dart';
import 'add blog/add_blog_screen.dart';

class AddBlogDetailScreen extends StatefulWidget {
  const AddBlogDetailScreen({super.key});

  @override
  State<AddBlogDetailScreen> createState() => _AddBlogDetailScreenState();
}

class _AddBlogDetailScreenState extends State<AddBlogDetailScreen> {
  final blogDetailController =
      Get.put<BlogDetailController>(BlogDetailController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      blogDetailController.getBlogApi();
    });
    // TODO: implement initState
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
                        "Pages / Blogs",
                        style: const TextStyle().normal20w300g,
                      ),
                      Text(
                        "BLOG LIST",
                        style: const TextStyle().normal28w400,
                      ),
                      const Gap(34),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CommonAppButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddBlogScreen()));
                    },
                    check: true,
                    width: 331,
                    icon: Icons.add,
                    text: "Add Blog",
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
                      (blogDetailController.getBlogModel.value?.data ?? [])
                          .length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 350,
                      maxCrossAxisExtent: 570
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          getImageView(
                            finalUrl:
                            blogDetailController.getBlogModel.value
                                    ?.data?[index].heroImage
                                    .toString() ??
                                "",
                            fit: BoxFit.fill,
                            height: 250,
                            width: 525,
                          ),
                          const Gap(14),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    blogDetailController
                                            .getBlogModel.value?.data?[index].title
                                            .toString() ??
                                        "",
                                    style: Responsive.isDesktop(context)
                                        ? TextStyle().normal20w400
                                        : TextStyle().normal16w400,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddBlogScreen(

                                                      data: blogDetailController.getBlogModel.value?.data?[index],
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
                                            height: Responsive.isDesktop(context)
                                                ? 16
                                                : 8,
                                            width: Responsive.isDesktop(context)
                                                ? 16
                                                : 8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(8),
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
                                                    blogDetailController.delBlogApi(blogDetailController.getBlogModel.value?.data?[index].id);
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
                                            height: Responsive.isDesktop(context)
                                                ? 16
                                                : 8,
                                            width: Responsive.isDesktop(context)
                                                ? 16
                                                : 8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
