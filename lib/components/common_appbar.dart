import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:ft_chetak_books/res/color_schema.dart';
import 'package:ft_chetak_books/res/text_style.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final TextStyle? textStyle;
  final bool deleteIcon;
  final Callback? ontap;
  final Callback? reloadOnTap;

  const CommonAppBar({
    Key? key,
    this.title,
    this.ontap,
    this.leading,
    this.reloadOnTap,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.deleteIcon = false,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading
          ? leading ??
              GestureDetector(
                onTap: ontap ??
                    () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pop(context);
                    },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.black,
                ),
              )
          : Container(),
      backgroundColor: AppColor.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.black, size: 24),
      centerTitle: true,
      titleTextStyle: textStyle ??
          const TextStyle(color: AppColor.primarySkyBlue).normal18w500,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
