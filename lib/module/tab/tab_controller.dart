
import 'package:ft_chetak_books/models/category_model.dart';
import 'package:ft_chetak_books/module/portfolio/portfolio_screen.dart';
import 'package:ft_chetak_books/module/banner/banner_list.dart';
import 'package:ft_chetak_books/module/home_page_video/home_page_screen.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

import '../blogs/blog_detail_screen.dart';
import '../by_the_number/by_the_number_screen.dart';
import '../featured/featured_screen.dart';
import '../gallery/gallery_screen.dart';
import '../ongoing_projects/ongoing_projects_screen.dart';
import '../studio_images/studio_image_screen.dart';
import '../testimonial/testimonial_screen.dart';



class TabBarController extends GetxController {
  Rxn<CategoryModel> categoryModel = Rxn<CategoryModel>();

  RxInt selectedIndex = 0.obs;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
    5: GlobalKey<NavigatorState>(),
    6: GlobalKey<NavigatorState>(),
    7: GlobalKey<NavigatorState>(),
    8: GlobalKey<NavigatorState>(),
    9: GlobalKey<NavigatorState>(),
    10: GlobalKey<NavigatorState>(),
  };
  RxList<Widget> widget = <Widget>[
    const HomePageScreen(),
    const PortfolioScreen(),
    const OngoingProjectsScreen(),
    const GalleryScreen(),
    const AddBlogDetailScreen(),
     ByTheNumberScreen(),
    const TestimonialScreen(),
    const StudioImagesScreen(),
    const FeaturedScreen(),
    const BannerListScreen(),

  ].obs;

  Future<void> getCategories() async {
    try {
      var resp = await callApi(
        dio.get(
          "categories",
        ),
      );
      if (resp != null) {
        categoryModel.value = CategoryModel.fromJson(resp.data);
        print(categoryModel);
      }
      dismissLoader();
    } catch (e) {
      dismissLoader();
    }
  }

  RxList tabBar = [
    {"text": "Home page video", "image": AppImage.firstImage},
    {"text": "Portfolio", "image": AppImage.secondImage},
    {"text": "Ongoing projects", "image": AppImage.thirdImage},
    {"text": "Gallery", "image": AppImage.forthImage},
    {"text": "Blogs", "image": AppImage.fifthImage},
    {"text": "By the number", "image": AppImage.sixthImage},
    {"text": "Testimonials", "image": AppImage.sevenImage},
    {"text": "Studio images", "image": AppImage.eightImage},
    {"text": "Featured", "image": AppImage.nineImage},
    {"text": "Banners", "image": AppImage.nineImage},

  ].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCategories();
    });
    super.onInit();
  }
}
