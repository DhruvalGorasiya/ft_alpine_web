import 'package:ft_chetak_books/components/input_field.dart';
import 'package:ft_chetak_books/module/testimonial/add%20testimonial/add_testimonial_controller.dart';
import 'package:ft_chetak_books/package/config_packages.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/get_testimonial_model.dart';

class AddTestimonialScreen extends StatefulWidget {
    Data?data;
   AddTestimonialScreen({super.key,this.data});

  @override
  State<AddTestimonialScreen> createState() => _AddTestimonialScreenState();
}

class _AddTestimonialScreenState extends State<AddTestimonialScreen> {
  final addTestimonialController =
      Get.put<AddTestimonialController>(AddTestimonialController());
@override
  void initState() {
    // TODO: implement initState
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    if(widget.data != null){
      addTestimonialController.clientNameController.text = widget.data?.clientName??"";
      addTestimonialController.clientDesignationController.text = widget.data?.clientDesignation??"";
      addTestimonialController.feedbackController.text = widget.data?.feedback??"";
    }
    else{
      addTestimonialController.clientNameController.clear();
      addTestimonialController.clientDesignationController.clear();
      addTestimonialController.feedbackController.clear();
    }
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
              GestureDetector(onTap: (){
                Navigator.pop(context);
              },child: Icon(Icons.arrow_back)),
              Gap(10),
              Text(
                "Pages / Testimonials / Add Testimonial",
                style: GoogleFonts.genos().normal20w300g,
              ),
              Text(
                "ADD TESTIMONIAL",
                style: GoogleFonts.genos().normal28w400,
              ),
              const Gap(34),
              Text(
                "Client name",
                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
              ),
              const Gap(8),
              InputField(
                controller: addTestimonialController.clientNameController,
                hint: "Enter here",
                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
              ),
              const Gap(18),
              Text(
                "Client designation",
                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
              ),
              const Gap(8),
              InputField(
                controller: addTestimonialController.clientDesignationController,
                hint: "Enter here",
                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
              ),
              const Gap(18),
              Text(
                "Feedback",
                style: GoogleFonts.genos().normal18w500g.textColor(AppColor.grayColor),
              ),
              const Gap(8),
              InputField(
                maxLine: 5,
                controller: addTestimonialController.feedbackController,
                hint: "Enter here",
                hintStyle: GoogleFonts.genos().normal18w400g.textColor(AppColor.black),
              ),
              const Gap(34),
              CommonAppButton(
                onTap: () {
                  widget.data!=null?addTestimonialController.updateTestimonialApi(context,widget.data?.id ):addTestimonialController.createTestimonialApi(context);
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
