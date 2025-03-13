import 'package:ft_chetak_books/components/common_function.dart';
import 'package:ft_chetak_books/module/portfolio/portfolio%20detail/portfolio_detail_controller.dart';
import 'package:ft_chetak_books/utils/common_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../package/config_packages.dart';
import '../add protfolio/add_protfolio_screen.dart';

class PortfolioDetailScreen extends StatefulWidget {
  String? name;
  int? id;

  PortfolioDetailScreen({super.key, required this.name, this.id});

  @override
  State<PortfolioDetailScreen> createState() => _PortfolioDetailScreenState();
}

class _PortfolioDetailScreenState extends State<PortfolioDetailScreen> {
  final portfolioDetailController = Get.put<PortfolioDetailController>(PortfolioDetailController());

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      portfolioDetailController.getPortfolioApi(widget.id);
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
                          child: const Icon(Icons.arrow_back)),
                      const Gap(10),
                      Text(
                        "Pages / Portfolio / ${widget.name}  ",
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
                          builder: (context) => AddPortfolioScreen(
                            name: widget.name,
                            i: widget.id,
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
                    itemCount: (portfolioDetailController.getPortfolioModel.value?.data ?? []).length,
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
                                      builder: (context) => AddPortfolioScreen(
                                        name: widget.name,
                                        i: widget.id,
                                        getPortfolioModel: portfolioDetailController.getPortfolioModel.value?.data?[index],
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
                                            portfolioDetailController.delPortfolioApi(portfolioDetailController.getPortfolioModel.value?.data?[index].id, context,widget.id);
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
                          portfolioDetailController.getPortfolioModel.value?.data?[index].projectName ?? "",
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
                                  portfolioDetailController.getPortfolioModel.value?.data?[index].verticleImage?.length ?? 0,
                                  (i) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: getImageView(
                                      finalUrl: portfolioDetailController.getPortfolioModel.value?.data?[index].verticleImage?[i].url ?? "",
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
                                  portfolioDetailController.getPortfolioModel.value?.data?[index].horizontalImage?.length ?? 0,
                                  (i) => Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: getImageView(
                                      finalUrl: portfolioDetailController.getPortfolioModel.value?.data?[index].horizontalImage?[i].url ?? "",
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
          ],
        ),
      ),
    );
  }
}
