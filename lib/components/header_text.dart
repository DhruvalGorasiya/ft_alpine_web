import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:ft_chetak_books/utils/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.text, this.textStyle, this.color});

  final String text;
  final TextStyle? textStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          (Responsive.isDesktop(context)
              ? GoogleFonts.genos()
                  .textColor(color ?? AppColor.black)
                  .normal32w600
              : GoogleFonts.genos()
                  .textColor(color ?? AppColor.black)
                  .normal22w600),
    );
  }
}
