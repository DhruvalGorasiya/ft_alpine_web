import 'package:ft_chetak_books/module/authentication/create%20new%20password/create_new_password_screen.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import '../../../components/common_button.dart';
import '../../../components/common_column_sidebar.dart';
class CheckMailScreen extends StatefulWidget {
  String?email;
   CheckMailScreen({super.key,required this.email});

  @override
  State<CheckMailScreen> createState() => _CheckMailScreenState();
}

class _CheckMailScreenState extends State<CheckMailScreen> {
  // final Uri url = Uri.parse('https://mail.google.com');
  Future _launchUrl(Uri url) async {
    if (!await _launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Row(
          children: [
            Responsive.isDesktop(context)?const CommonColumnSideBar():const SizedBox(),
            const Spacer(),
            Center(
              child: Responsive.isDesktop(context)?Container(
                height: MediaQuery.of(context).size.height/1.4,
                width: MediaQuery.of(context).size.width/2.6,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: AppColor.gray2Color
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 64, left: 119, right: 119, bottom: 64),
                  child: Column(
                    children: [
                      Image.asset(AppImage.mailImage,height: 120,width: 120,),
                      const Gap(24),
                      Text("Check your mail",style: const TextStyle().normal24w400,),
                      const Gap(8),
                      Center(child: Text("We have sent a password recover instructions to your email.",style: const TextStyle().normal20w400g,textAlign: TextAlign.center,)),
                      const Spacer(),
                      CommonButton(
                        onTap: (){
                             _launchUrl(Uri.parse('https://mail.google.com'));
                        },
                        text: "Open email app",
                        boxColor: AppColor.black,
                        borderRadius: 4,

                      ),
                      const Gap(24),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CreateNewPasswordScreen(email: widget.email,)));
                          },
                          child: Text("Skip, I’ll confirm later",style: const TextStyle().normal22w400g.textColor(AppColor.black),))
                    ],
                  ),
                ),
              ):Container(
                height: MediaQuery.of(context).size.height/1.7,
                width: MediaQuery.of(context).size.width/1.8,
                decoration: BoxDecoration(
                  color: AppColor.white,
                ),
                child: Column(
                  children: [
                    Image.asset(AppImage.mailImage,height: 120,width: 120,),
                    const Gap(24),
                    Text("Check your mail",style: const TextStyle().normal24w400,),
                    const Gap(8),
                    Center(child: Text("We have sent a password recover instructions to your email.",style: const TextStyle().normal20w400g,textAlign: TextAlign.center,)),
                    const Spacer(),
                    CommonButton(
                      onTap: (){
                        _launchUrl(Uri.parse('https://mail.google.com'));
                      },
                      text: "Open email app",
                      boxColor: AppColor.black,
                      borderRadius: 4,

                    ),
                    const Gap(24),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  CreateNewPasswordScreen(email: widget.email,)));
                        },
                        child: Text("Skip, I’ll confirm later",style: const TextStyle().normal22w400g.textColor(AppColor.black),))
                  ],
                ),
              ),
            ),
            const Spacer()
          ],

        )
    );
  }
}
