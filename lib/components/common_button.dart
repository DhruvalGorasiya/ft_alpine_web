import '../package/config_packages.dart';

class CommonButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
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
  Color? boxColor;

  CommonButton(
      {Key? key,
      this.onTap,
      this.text,
      this.color,
      this.height,
      this.textColor,
      this.style,
      this.borderRadius,
      this.width,
      this.boxShadow,
      this.border,
      this.isAddButton,
      this.buttonColor,
      this.disableButtonColor,
      this.boxColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: height ?? 49,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: boxColor ?? AppColor.black,
          borderRadius: BorderRadius.circular(borderRadius ?? 69),
          boxShadow: boxShadow,
        ),
        child: Center(
          child: Text(
            text!,
            style: style ??
                const TextStyle().normal26w600g.textColor(AppColor.white),
          ),
        ),
      ),
    );
  }
}
