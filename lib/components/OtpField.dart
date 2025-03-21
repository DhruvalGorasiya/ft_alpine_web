import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:ft_chetak_books/res/color_schema.dart';
import 'package:ft_chetak_books/res/text_style.dart';


typedef OnValidation = dynamic Function(String? text);

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final Function(String?)? onChange;
  final Function(String?)? onSubmitted;
  final TextInputAction? textInputAction;
  const OtpField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.hint = "",
    this.onChange,
    this.onSubmitted,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.primarySkyBlue,
      maxRadius: 24,
      child: TextFormField(
        cursorColor: AppColor.primarySkyBlue,
        focusNode: focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        autofocus: false,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        style:  TextStyle(color: AppColor.primarySkyBlue).normal14w500,
        decoration: InputDecoration(
            hintStyle:  const TextStyle(color: AppColor.primarySkyBlue).normal14w500,
            fillColor: AppColor.white,
            contentPadding: EdgeInsets.symmetric(vertical: 14.0,), // Adjust padding as needed
            hintText: hint,
          isCollapsed: true,

          // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(12),
            //   borderSide: BorderSide(
            //     color: AppColor.softGrey,
            //   ),
            // ),
            // errorBorder:  OutlineInputBorder(
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(8),
            //     ),
            //     borderSide: BorderSide(color: AppColor.red)),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:  BorderSide(
                  width: 2,
                  color:  AppColor.primarySkyBlue
              ),
            ),
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  width: 2,
                  color:  AppColor.primarySkyBlue
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:  const BorderSide(
                width: 2,
                color: AppColor.primarySkyBlue,
              ),
            ),

            filled: true,
        ),

        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: TextInputType.number,
        onChanged: (val) {
          if (onChange != null) {
            onChange!(val);
          }
        },
        onFieldSubmitted: onSubmitted,
      ),
    );
  }


}
