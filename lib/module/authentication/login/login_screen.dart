import 'package:flutter/cupertino.dart';
import 'package:ft_chetak_books/components/common_button.dart';
import 'package:ft_chetak_books/components/common_column_sidebar.dart';
import 'package:ft_chetak_books/module/authentication/login/login_controller.dart';
import 'package:ft_chetak_books/module/authentication/reset%20password/reset_password_screen.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/input_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final logInController = Get.put<LogInController>(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        body: Row(
          children: [
            Responsive.isDesktop(context) ? CommonColumnSideBar() : SizedBox(),
            const Spacer(),
            Center(
              child: Responsive.isDesktop(context)
                  ? Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: MediaQuery.of(context).size.width / 2.7,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.gray2Color),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 64, left: 119, right: 119, bottom: 64),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Log In",
                              style: GoogleFonts.genos()
                                  .normal24w400
                                  .textColor(AppColor.black2Color),
                            ),
                            const Gap(44),
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
                                  ]),
                              child: InputField(
                                controller: logInController.emailController,
                                prefixIcon: const Icon(
                                  Icons.mail_outline,
                                  color: AppColor.grayDarkColor,
                                ),
                                hint: "Enter Email",
                                hintStyle: GoogleFonts.genos()
                                    .normal16w400g
                                    .textColor(AppColor.gray3Color),
                              ),
                            ),
                            const Gap(14),
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
                                  ]),
                              child: InputField(
                                controller: logInController.passWordController,
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: AppColor.grayDarkColor,
                                ),
                                hint: "Enter password",
                                hintStyle: GoogleFonts.genos()
                                    .normal16w400g
                                    .textColor(AppColor.gray3Color),
                              ),
                            ),
                            const Gap(14),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPasswordScreen()));
                              },
                              child: Text(
                                "Reset password",
                                style: GoogleFonts.genos()
                                    .normal16w500g
                                    .textColor(AppColor.gray3Color),
                              ),
                            ),
                            const Gap(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Obx(() {
                                  return CupertinoSwitch(
                                    value: logInController.state.value,
                                    onChanged: (value) {
                                      logInController.state.value = value;
                                    },
                                    thumbColor: AppColor.white,
                                    activeColor: CupertinoColors.black,
                                  );
                                }),
                                const Gap(6),
                                Text("Remember Me",
                                    style: GoogleFonts.genos()
                                        .normal16w400g
                                        .textColor(AppColor.black2Color),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis),
                                Spacer()
                              ],
                            ),
                            const Spacer(),
                            CommonButton(
                              onTap: () {
                                logInController.logInApiCall(context);
                              },
                              text: "Log In",
                              boxColor: AppColor.black,
                              borderRadius: 4,
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 1.7,
                      width: MediaQuery.of(context).size.width / 1.6,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: GoogleFonts.genos()
                                .normal24w400
                                .textColor(AppColor.black2Color),
                          ),
                          const Gap(44),
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
                                ]),
                            child: InputField(
                              controller: logInController.emailController,
                              prefixIcon: const Icon(
                                Icons.mail_outline,
                                color: AppColor.grayDarkColor,
                              ),
                              hint: "Enter Email",
                              hintStyle: GoogleFonts.genos()
                                  .normal14w500
                                  .textColor(AppColor.gray3Color),
                              borderColor: Colors.transparent,
                            ),
                          ),
                          const Gap(14),
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
                                ]),
                            child: InputField(
                              controller: logInController.passWordController,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColor.grayDarkColor,
                              ),
                              hint: "Enter password",
                              hintStyle: GoogleFonts.genos()
                                  .normal16w400g
                                  .textColor(AppColor.gray3Color),
                              borderColor: Colors.transparent,
                            ),
                          ),
                          const Gap(14),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordScreen()));
                            },
                            child: Text(
                              "Reset password",
                              style: GoogleFonts.genos()
                                  .normal16w500g
                                  .textColor(AppColor.gray3Color),
                            ),
                          ),
                          const Gap(44),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(),
                              Obx(() {
                                return CupertinoSwitch(
                                  value: logInController.state.value,
                                  onChanged: (value) {
                                    logInController.state.value = value;
                                  },
                                  thumbColor: AppColor.white,
                                  activeColor: CupertinoColors.black,
                                );
                              }),
                              const Gap(6),
                              Expanded(
                                child: Text("Remember Me",
                                    style: GoogleFonts.genos()
                                        .normal16w400g
                                        .textColor(AppColor.black2Color),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Spacer()
                            ],
                          ),
                          const Spacer(),
                          CommonButton(
                            onTap: () {
                              logInController.logInApiCall(context);
                            },
                            text: "Log In",
                            boxColor: AppColor.black,
                            borderRadius: 4,
                          )
                        ],
                      ),
                    ),
            ),
            const Spacer()
          ],
        ));
  }
}
