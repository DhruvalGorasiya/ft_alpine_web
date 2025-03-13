import 'package:ft_chetak_books/components/common_button.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/common_column_sidebar.dart';
import '../../../components/input_field.dart';
import 'create_new_password_controller.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  String?email;
   CreateNewPasswordScreen({super.key,required this.email});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final createNewPasswordController = Get.put<CreateNewPasswordController>(CreateNewPasswordController());

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Create New Password", style: GoogleFonts.genos().normal22w400,)),
                      const Gap(8),
                      Text("Your new password must be different from previous used passwords.",style: GoogleFonts.genos().normal16w400g,textAlign: TextAlign.center,),
                      const Gap(17),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.black.withOpacity(0.06),
                                blurRadius: 8.0,
                                offset: const Offset(0, 4),
                              ),
                              BoxShadow(
                                color: AppColor.black.withOpacity(0.04),
                                blurRadius: 4.0,
                                offset: const Offset(0, 0),
                              ),
                            ]
                        ),
                        child: InputField(
                          controller: createNewPasswordController.passWordController,
                          prefixIcon: const Icon(
                            Icons.lock_outline, color: AppColor.grayDarkColor,
                            size: 20,),
                          hint: "Enter new password",
                          hintStyle: GoogleFonts.genos().normal16w400g.textColor(
                              AppColor.gray3Color),
                          borderColor: Colors.transparent,

                        ),
                      ),
                      const Gap(17),
                      Text("Must be at least 8 characters.",style: GoogleFonts.genos().normal16w400g.textColor(
                          AppColor.gray3Color),),
                      const Gap(17),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.black.withOpacity(0.06),
                                blurRadius: 8.0,
                                offset: const Offset(0, 4),
                              ),
                              BoxShadow(
                                color: AppColor.black.withOpacity(0.04),
                                blurRadius: 4.0,
                                offset: const Offset(0, 0),
                              ),
                            ]
                        ),
                        child: InputField(
                          controller: createNewPasswordController.confirmPassWordController,
                          prefixIcon: const Icon(
                            Icons.lock_outline, color: AppColor.grayDarkColor,
                            size: 20,),
                          hint: "Confirm password",
                          hintStyle: GoogleFonts.genos().normal16w400g.textColor(
                              AppColor.gray3Color),
                          borderColor: Colors.transparent,
                        ),
                      ),
                      const Gap(17),
                      Text("Both password must match.",
                        style: GoogleFonts.genos().normal16w400g.textColor(
                            AppColor.gray3Color),),
                      const Spacer(),
                      CommonButton(
                        onTap: (){
                          createNewPasswordController.forgetPasswordApiCall(context,widget.email);
                        },
                        text: "Reset Password",

                        boxColor: AppColor.black,
                        borderRadius: 4,

                      )
                    ],
                  ),
                ),
              ):Container(
                height: MediaQuery.of(context).size.height/1.6,
                width: MediaQuery.of(context).size.width/1.6,
                decoration: BoxDecoration(
                  color: AppColor.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("Create New Password", style: GoogleFonts.genos().normal22w400,)),
                    const Gap(8),
                    Text("Your new password must be different from previous used passwords.",style: GoogleFonts.genos().normal16w400g,textAlign: TextAlign.center,),
                    const Gap(17),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.black.withOpacity(0.06),
                              blurRadius: 8.0,
                              offset: const Offset(0, 4),
                            ),
                            BoxShadow(
                              color: AppColor.black.withOpacity(0.04),
                              blurRadius: 4.0,
                              offset: const Offset(0, 0),
                            ),
                          ]
                      ),
                      child: InputField(
                        controller: createNewPasswordController.passWordController,
                        prefixIcon: const Icon(
                          Icons.lock_outline, color: AppColor.grayDarkColor,
                          size: 20,),
                        hint: "Enter new password",
                        hintStyle: GoogleFonts.genos().normal16w400g.textColor(
                            AppColor.gray3Color),
                        borderColor: Colors.transparent,

                      ),
                    ),
                    const Gap(17),
                    Text("Must be at least 8 characters.",style: GoogleFonts.genos().normal16w400g.textColor(
                        AppColor.gray3Color),),
                    const Gap(17),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.black.withOpacity(0.06),
                              blurRadius: 8.0,
                              offset: const Offset(0, 4),
                            ),
                            BoxShadow(
                              color: AppColor.black.withOpacity(0.04),
                              blurRadius: 4.0,
                              offset: const Offset(0, 0),
                            ),
                          ]
                      ),
                      child: InputField(
                        controller: createNewPasswordController.confirmPassWordController,
                        prefixIcon: const Icon(
                          Icons.lock_outline, color: AppColor.grayDarkColor,
                          size: 20,),
                        hint: "Confirm password",
                        hintStyle: GoogleFonts.genos().normal16w400g.textColor(
                            AppColor.gray3Color),
                        borderColor: Colors.transparent,
                      ),
                    ),
                    const Gap(17),
                    Text("Both password must match.",
                      style: GoogleFonts.genos().normal16w400g.textColor(
                          AppColor.gray3Color),),
                    const Spacer(),
                    CommonButton(
                      onTap: (){
                        createNewPasswordController.forgetPasswordApiCall(context,widget.email);
                      },
                      text: "Reset Password",

                      boxColor: AppColor.black,
                      borderRadius: 4,

                    )
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
