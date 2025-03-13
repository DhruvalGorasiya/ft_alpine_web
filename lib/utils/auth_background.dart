import '../package/config_packages.dart';

class AuthCommonBackground extends StatelessWidget {
  const AuthCommonBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImage.loginImage,
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
