import 'package:ft_chetak_books/module/authentication/reset%20password/reset_password_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../components/common_button.dart';
import '../../../components/common_column_sidebar.dart';
import '../../../components/input_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final resetPasswordController = Get.put<ResetPasswordController>(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Row(
          children: [
            Responsive.isDesktop(context) ? const CommonColumnSideBar() : const SizedBox(),
            const Spacer(),
            Center(
              child: Responsive.isDesktop(context)
                  ? Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      width: MediaQuery.of(context).size.width / 2.6,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.gray2Color),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 64, left: 119, right: 119, bottom: 64),
                        child: Column(
                          children: [
                            Text(
                              "Reset Password",
                              style: GoogleFonts.genos().normal24w400.textColor(AppColor.black2Color),
                            ),
                            const Gap(13),
                            Text(
                              "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                              style: GoogleFonts.genos().normal16w400g.textColor(AppColor.black2Color),
                              textAlign: TextAlign.center,
                            ),
                            const Gap(25),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColor.white, boxShadow: [
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
                              ]),
                              child: InputField(
                                controller: resetPasswordController.emailController,
                                prefixIcon: const Icon(
                                  Icons.mail_outline,
                                  color: AppColor.grayDarkColor,
                                  size: 20,
                                ),
                                hint: "Enter Email",
                                hintStyle: GoogleFonts.genos().normal16w400g.textColor(AppColor.gray3Color),
                                borderColor: Colors.transparent,
                              ),
                            ),
                            // const Spacer(),
                            const Gap(25),
                            CommonButton(
                              onTap: () {
                                resetPasswordController.forgetPasswordApiCall(context);
                              },
                              text: "Send Instructions",
                              boxColor: AppColor.black,
                              borderRadius: 4,
                            ),
                            const Gap(15),
                            Countdown(
                              seconds: 30,
                              build: (BuildContext context, double time) {
                                Duration duration = Duration(seconds: time.toInt());

                                String formattedTime =
                                    '${duration.inMinutes.remainder(60).toString().padLeft(1, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}';

                                return Text(
                                  "Re-send Instructions in $formattedTime",
                                  style: GoogleFonts.genos().normal20w400g.textColor(
                                        AppColor.black3Color,
                                      ),
                                );
                              },
                              interval: const Duration(seconds: 1),
                              onFinished: () {
                                // otpController.isResend.value = false;
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      width: MediaQuery.of(context).size.width / 1.7,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Reset Password",
                            style: GoogleFonts.genos().normal24w400.textColor(AppColor.black2Color),
                          ),
                          const Gap(13),
                          Text(
                            "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                            style: GoogleFonts.genos().normal16w400g.textColor(AppColor.black2Color),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(25),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: AppColor.white, boxShadow: [
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
                            ]),
                            child: InputField(
                              controller: resetPasswordController.emailController,
                              prefixIcon: const Icon(
                                Icons.mail_outline,
                                color: AppColor.grayDarkColor,
                                size: 20,
                              ),
                              hint: "Enter Email",
                              hintStyle: GoogleFonts.genos().normal16w400g.textColor(AppColor.gray3Color),
                              borderColor: Colors.transparent,
                            ),
                          ),
                          const Gap(25),
                          CommonButton(
                            onTap: () {
                              resetPasswordController.forgetPasswordApiCall(context);
                            },
                            text: "Send Instructions",
                            boxColor: AppColor.black,
                            borderRadius: 4,
                          ),
                          const Gap(25),
                          Countdown(
                            seconds: 30,
                            build: (BuildContext context, double time) {
                              Duration duration = Duration(seconds: time.toInt());

                              String formattedTime =
                                  '${duration.inMinutes.remainder(60).toString().padLeft(1, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}';

                              return Text(
                                "Re-send Instructions in $formattedTime",
                                style: GoogleFonts.genos().normal20w400g.textColor(
                                      AppColor.black3Color,
                                    ),
                              );
                            },
                            interval: const Duration(seconds: 1),
                            onFinished: () {
                              // otpController.isResend.value = false;
                            },
                          ),
                        ],
                      ),
                    ),
            ),
            const Spacer()
          ],
        ));
  }
}
