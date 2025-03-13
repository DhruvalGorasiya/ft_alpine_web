import '../package/config_packages.dart';

class CommonDialog extends StatelessWidget {
  void Function()? cancelOnTap;
  void Function()? deleteOnTap;
   CommonDialog({super.key,this.cancelOnTap,this.deleteOnTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Setting it to 0 to remove the default BorderRadius
        ),
        child: SizedBox(
          height: 360,
          width: 450,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36,vertical: 36),
            child:  Column(
              children: [
                Container(
                  height: 74,
                  width: 74,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(74),
                      border: Border.all(
                        width: 2,
                          color: AppColor.redColor
                      )
                  ),
                  child:  Center(child: Image.asset(AppImage.clearIcon,height: 30,width: 30,)),
                ),
                const Gap(10),
                 Text("Are you sure?",style: TextStyle().normal28w400.textColor(AppColor.grayColor),),
                Gap(12),
                Text("Do you really want to delete this project? This action cannot be undone.",style: TextStyle().normal20w400g.textColor(AppColor.grayColor),textAlign: TextAlign.center,),
                Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap:cancelOnTap,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColor.grayColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 44,vertical: 6),
                          child: Text("Cancel",style: const TextStyle().normal20w500g.textColor(AppColor.white),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: deleteOnTap,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColor.redColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 44,vertical: 6),
                          child: Text("Delete",style: const TextStyle().normal20w500g.textColor(AppColor.white),),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}

// class CommonDialog {
//   Dialog entryDialog = Dialog(
//       child: SizedBox(
//         height: 200,
//         width: 200,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child:  Column(
//             children: [
//               Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(
//                         color: AppColor.redColor
//                     )
//                 ),
//                 child: const Center(child: Icon(Icons.clear,color: AppColor.redColor,)),
//               ),
//               const Gap(10),
//               const Text("Are you sure?"),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                         color: AppColor.grayColor
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//                       child: Text("Cancel",style: const TextStyle().normal14w600,),
//                     ),
//                   ), Container(
//                     decoration: const BoxDecoration(
//                         color: AppColor.redColor
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//                       child: Text("Ok",style: const TextStyle().normal14w600,),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       )
//   );
// }
