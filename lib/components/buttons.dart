import 'package:ft_chetak_books/package/config_packages.dart';

class CommonAppButton extends StatelessWidget {
  final Function()? onTap;
  final ButtonType buttonType;
  final bool? isBorder;
  final String? text;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final TextStyle? style;
  final double? borderRadius;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final bool? isAddButton;
  final Color? buttonColor;
  final Color? disableButtonColor;
  final bool? check;

  const CommonAppButton({
    Key? key,
    this.onTap,
    this.buttonType = ButtonType.disable,
    this.text,
    this.color,
    this.icon,
    this.height,
    this.textColor,
    this.style,
    this.borderRadius,
    this.isBorder = false,
    this.width,
    this.boxShadow,
    this.border,
    this.isAddButton,
    this.buttonColor,
    this.disableButtonColor,
    this.check = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color background =
        disableButtonColor ?? AppColor.accentColor.withOpacity(0.5);
    switch (buttonType) {
      case ButtonType.enable:
        {
          if (isAddButton == true) {
            background = buttonColor!;
          } else {
            background = AppColor.accentColor;
          }
        }
        break;
      case ButtonType.disable:
        {
          background =
              disableButtonColor ?? AppColor.accentColor.withOpacity(0.5);
        }
        break;
      case ButtonType.progress:
        break;
    }
    return Material(
      color: isBorder == true ? null : background,
      // borderRadius: BorderRadius.circular(borderRadius ?? 69),
      child: InkWell(
        hoverColor: (buttonType == ButtonType.enable)
            ? buttonColor ?? Colors.transparent
            : AppColor.fillColor,
        // borderRadius: BorderRadius.circular(borderRadius ?? 69),
        onTap: (buttonType == ButtonType.enable) ? (onTap ?? () {}) : () {},
        child: Container(
          height: height ?? 44,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            color: isBorder == true ? Colors.white : Colors.transparent,
            border: isBorder == true
                ? Border.all(width: 1.5, color: AppColor.orangeColor)
                : null,
            // borderRadius: BorderRadius.circular(borderRadius ?? 69),
            boxShadow: boxShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              check == true
                  ? Icon(
                      icon,
                      color: AppColor.white,
                    )
                  : const SizedBox(),
              check == true ? Gap(4) : Gap(0),
              Responsive.isDesktop(context)
                  ? Center(
                      child: Text(
                        text!,
                        style: style ??
                            const TextStyle().normal24w500g.textColor(
                                isBorder == true
                                    ? AppColor.orangeColor
                                    : AppColor.white),
                      ),
                    )
                  : Center(
                      child: Text(
                        text!,
                        style: style ??
                            const TextStyle().normal18w500g.textColor(
                                isBorder == true
                                    ? AppColor.orangeColor
                                    : AppColor.white),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
