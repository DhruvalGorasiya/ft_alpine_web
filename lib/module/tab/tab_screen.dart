import 'package:ft_chetak_books/module/tab/tab_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              forceMaterialTransparency: true,
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImage.logo,
                    fit: BoxFit.contain,
                    height: 130,
                  ),
                ],
              ),
            ),
      drawer: Builder(
        builder: (BuildContext context) {
          if (!Responsive.isDesktop(context)) {
            return SizedBox(
              width: 250,
              child: _menuWidget(context),
            );
          } else {
            return Container();
          }
        },
      ),
      // backgroundColor: AppColor.primaryCream,
      body: _bodyWidget(context),
    );
  }
}

Widget _bodyWidget(context) {
  final tabBarController = Get.put<TabBarController>(TabBarController());
  return Column(
    children: [
      // if (Responsive.isDesktop(context)) headerWidget(),
      // if (Responsive.isDesktop(context))

      Expanded(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: _menuWidget(context),
              ),
            Expanded(
              flex: 7,
              child: Obx(
                () {
                  return Navigator(
                    key: tabBarController
                        .navigatorKeys[tabBarController.selectedIndex.value],
                    onGenerateRoute: (RouteSettings settings) {
                      return MaterialPageRoute(builder: (_) {
                        return tabBarController.widget
                            .elementAt(tabBarController.selectedIndex.value);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      )
    ],
  );
}

// Padding headerWidget() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 21),
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(45), color: AppColor.white),
//       child: Row(
//         children: [
//           Image.asset(
//             AppImage.logo,
//             height: 40,
//           ),
//           const Spacer(),
//           Container(
//             width: 390,
//             padding: const EdgeInsets.only(left: 20, right: 20),
//             child: TextFormField(
//               style: GoogleFonts.genos().normal14w500.textColor(AppColor.black),
//               cursorColor: AppColor.black,
//               decoration: InputDecoration(
//                 isDense: true,
//                 contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 hintText: 'Search',
//                 suffixIcon: const Icon(
//                   Icons.search,
//                   color: AppColor.orangeColor,
//                 ),
//                 hintStyle: GoogleFonts.genos()
//                     .normal14w500
//                     .textColor(AppColor.orangeColor),
//                 fillColor: AppColor.black.withOpacity(.04),
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.transparent),
//                   borderRadius: BorderRadius.circular(97),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.transparent),
//                   borderRadius: BorderRadius.circular(97),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.transparent),
//                   borderRadius: BorderRadius.circular(97),
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.notifications,
//               color: AppColor.orangeColor,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget _menuWidget(context) {
  final tabBarController = Get.put<TabBarController>(TabBarController());

  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
      color: AppColor.black,
    ),
    child: Container(
      // decoration: Responsive.isDesktop(context)
      //     ? CommonContainerDecoration.boxDecoration(borderRadius: 15)
      //     : null,
      // margin: const EdgeInsets.only(bottom: 38),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppImage.logo,
              fit: BoxFit.contain,
              height: 130,
            ),
            ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              itemCount: tabBarController.tabBar.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    tabBarController.selectedIndex.value = index;
                    if (Responsive.isMobile(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent),
                      child: Row(
                        children: [
                          Image.asset(
                            tabBarController.tabBar[index]['image'],
                            height: 20,
                            color: tabBarController.selectedIndex.value == index
                                ? AppColor.accentColor
                                : AppColor.white.withOpacity(0.7),
                          ),
                          const Gap(12),
                          Expanded(
                            child: Text(
                              tabBarController.tabBar[index]['text'],
                              style: GoogleFonts.genos().normal20w500g.textColor(
                                    tabBarController.selectedIndex.value ==
                                            index
                                        ? AppColor.accentColor
                                        : AppColor.white.withOpacity(0.5),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}
