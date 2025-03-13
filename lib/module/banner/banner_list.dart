import 'package:flutter/material.dart';
import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/module/banner/add/add_banner_screen.dart';
import 'package:ft_chetak_books/module/banner/banner_list_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:ft_chetak_books/utils/common_dialog.dart';

class BannerListScreen extends StatefulWidget {
  const BannerListScreen({super.key});

  @override
  State<BannerListScreen> createState() => _BannerListScreenState();
}

class _BannerListScreenState extends State<BannerListScreen> {
  final bannerController = Get.put<BannerController>(BannerController());
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bannerController.getBannerApi();
    });
    super.initState();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Banners",
                        style: Responsive.isDesktop(context) ? TextStyle().normal32w600:TextStyle().normal22w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: Responsive.isDesktop(context) ? 1 : 2,
                  child: CommonAppButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  AddbannerScreen(),
                        ),
                      );
                    },
                    check: true,
                    width: 331,
                    icon: Icons.add,
                    text: "Add new Banners",
                    buttonType: ButtonType.enable,
                  ),
                )
              ],
            ),
            const Gap(30),
            Expanded(
              child: SizedBox(
                width: double.infinity, // Set width to occupy available space

                child: Obx(
                      () => ListView.builder(
                    itemCount: (bannerController.bannerModel.value?.data ?? []).length,
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
                                      builder: (context) => AddbannerScreen(
                                        bannerModel:  bannerController.bannerModel.value?.data?[index],
                                        // name: widget.name,
                                        // i: widget.id,
                                        // getPortfolioModel: portfolioDetailController.getPortfolioModel.value?.data?[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, right: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.accentColor),
                                  ),
                                  height: 30,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CommonDialog(cancelOnTap:(){
                                            Navigator.pop(context);
                                          },deleteOnTap: (){
                                            Navigator.pop(context);
                                            bannerController.delPortfolioApi( context,bannerController.bannerModel.value?.data?[index].id,);
                                          },));

                                },
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: AppColor.redColor),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(6.0),
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
                          bannerController.bannerModel.value?.data?[index].page ?? "",
                          style: const TextStyle().normal20w400.textColor(
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
                                  bannerController.bannerModel.value?.data?[index].images?.length ?? 0,
                                      (i) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: getImageView(
                                      finalUrl: bannerController.bannerModel.value?.data?[index].images?[i].url ?? "",
                                      height: 360,
                                      width: 245,
                                      fit: BoxFit.contain,
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

          ],
        ),
      ),
    );
  }
}
