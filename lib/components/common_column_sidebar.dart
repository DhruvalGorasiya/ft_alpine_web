import 'package:flutter/material.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/color_schema.dart';
import '../utils/image.dart';

class CommonColumnSideBar extends StatelessWidget {
  const CommonColumnSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width/5,
      decoration: const BoxDecoration(color: AppColor.black),
      child: Column(
        children: [
          Image.asset(
            AppImage.logo,
            height: 130,
            width: 78,
          ),
          Divider(
            color: AppColor.white.withOpacity(0.10),
            thickness: 2,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 69),
            child: Center(
                child: Text(
                  "A Product By Digilligence",
                  style: GoogleFonts.genos()
                      .normal20w400
                      .textColor(AppColor.white),
                  textAlign: TextAlign.center,
                )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
