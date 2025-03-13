import 'package:ft_chetak_books/components/input_field.dart';
import 'package:ft_chetak_books/package/config_packages.dart';

import 'by_the_number_controller.dart';

class ByTheNumberScreen extends StatefulWidget {
   ByTheNumberScreen({super.key});

  @override
  State<ByTheNumberScreen> createState() => _ByTheNumberScreenState();
}

class _ByTheNumberScreenState extends State<ByTheNumberScreen> {
  final byTheNumberController =
  Get.put<ByTheNumberController>(ByTheNumberController());
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      byTheNumberController.getByTheNumberApi();

    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pages / By the number",
                style: const TextStyle().normal20w300g,
              ),
              Text(
                "BY THE NUMBER",
                style: const TextStyle().normal28w400,
              ),
              const Gap(34),
              Text(
                "Sq Carpet Area Of Completed Projects",
                style: const TextStyle()
                    .normal18w500g
                    .textColor(AppColor.grayColor),
              ),
              const Gap(8),
              InputField(
                controller:
                byTheNumberController.projectAreaController,
                hint: "20lacs sq ft",
                hintStyle:
                const TextStyle().normal18w400g.textColor(AppColor.black),
              ),
              const Gap(18),
              Text(
                "Years Of Experience",
                style: const TextStyle()
                    .normal18w500g
                    .textColor(AppColor.grayColor),
              ),
              const Gap(8),
              InputField(
                controller: byTheNumberController.experienceController,
                hint: "14 years",
                hintStyle:
                const TextStyle().normal18w400g.textColor(AppColor.black),
              ),
              const Gap(18),
              Text(
                "Sq Carpet Area Of Ongoing Projects",
                style: const TextStyle()
                    .normal18w500g
                    .textColor(AppColor.grayColor),
              ),
              const Gap(8),
              InputField(
                controller: byTheNumberController.ongoingProjectAreaController,
                hint: "50 lacs sq ft",
                hintStyle:
                const TextStyle().normal18w400g.textColor(AppColor.black),
              ),

              const Gap(34),
              CommonAppButton(
                onTap:() {
                  byTheNumberController.getByTheNumberModel.value?.data?.forEach((element) {
                    byTheNumberController.updateByTheNumberApi(element.id);
                  });

                },
                width: 290,
                text: "Update",
                buttonType: ButtonType.enable,
              )
            ],
          ),
        ),
      ),
    );
  }
}
