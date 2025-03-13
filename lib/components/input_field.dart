import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnValidation = dynamic Function(String? text);

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool firstCapital;
  final bool disable;
  final String hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isHasInVisibleBorder;
  final List<TextInputFormatter>? inputFormatter;
  final OnValidation? validator;
  final Function(String?)? onChange;
  final Function(String?)? onSubmitted;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLine;
  final double? width;
  final Color? textFieldColor;
  final TextStyle? hintStyle;
  final Color? borderColor;
  BorderRadius? borderRadius;
  Color? hoverColor;

  InputField(
      {super.key,
      required this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.focusNode,
      this.obscureText = false,
      this.disable = false,
      this.firstCapital = false,
      this.hint = "",
      this.onChange,
      this.inputFormatter,
      this.onSubmitted,
      this.onTap,
      this.isHasInVisibleBorder = false,
      this.textInputAction,
      this.keyboardType,
      this.validator,
      this.maxLine,
      this.width,
      this.textFieldColor,
      this.hintStyle,
      this.borderColor,
      this.hoverColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap ?? () {},
      textCapitalization:
          firstCapital ? TextCapitalization.words : TextCapitalization.none,
      cursorColor: AppColor.black,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      focusNode: focusNode,
      autofocus: false,
      obscureText: obscureText,
      maxLines: maxLine,
      inputFormatters: inputFormatter ?? [],
      style: GoogleFonts.genos().normal16w500,
      decoration: InputDecoration(
        suffix: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        prefixIcon: prefixIcon,
        hoverColor: hoverColor ?? AppColor.fillColor.withOpacity(0.1),
        isCollapsed: true,
        enabled: !disable,
        // hintStyle: hintStyle ??
        //     const TextStyle(color: AppColor.secondaryColor).normal14w500,
        fillColor: textFieldColor ?? Colors.transparent,
        hintText: hint,
        disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide: BorderSide(
            width: 1,
            color: isHasInVisibleBorder == true
                ? Colors.transparent
                : borderColor ?? AppColor.grayColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide: BorderSide(
            width: 1,
            color: isHasInVisibleBorder == true
                ? Colors.transparent
                : borderColor ?? AppColor.grayColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide: BorderSide(
            width: 1,
            color: isHasInVisibleBorder == true
                ? Colors.transparent
                : borderColor ?? AppColor.grayColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide: BorderSide(
            width: 1,
            color: isHasInVisibleBorder == true
                ? Colors.transparent
                : borderColor ?? AppColor.grayColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide: BorderSide(
            width: 1,
            color: isHasInVisibleBorder == true
                ? Colors.transparent
                : borderColor ?? AppColor.grayColor,
          ),
        ),
        filled: true,
      ),
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.name,
      onChanged: (val) {
        if (onChange != null) {
          onChange!(val);
        }
      },
      onFieldSubmitted: onSubmitted,
      validator: (val) {
        if (validator != null) {
          return validator!(val);
        } else {
          return null;
        }
      },
    );
  }
}
