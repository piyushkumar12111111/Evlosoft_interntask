
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:mobileapplication/resources/colors/app_colors.dart';
// import 'package:mobileapplication/util/tools/design_configuration/design_configuration.dart';

// import '../../colors/debug_tools.dart';
// import '../../text_styles/text_styles.dart';
// import '../bottom_sheets/goal_bottom_sheet.dart';

// class HealthMatrixTile extends StatelessWidget {
//    HealthMatrixTile({super.key, required this.size, required this.svgTag, required this.title, required this.percentage, required this.centerTitle, this.radius, this.lineWidth, this.alertSigned, this.textController});

//   final DynamicSize size;
//   final String svgTag;
//   final String title;
//   final double percentage;
//   final String centerTitle;
//   final double? radius;
//   final double? lineWidth;
//   final bool? alertSigned;
//   final TextEditingController? textController;


//   @override
//   AddClientController controller = Get.put(AddClientController());
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: size.width(15), top: size.height(20), right: size.width(15),bottom: size.height(18)),
//       decoration: BoxDecoration(
//           color: AppColor.containerColor(context),
//           borderRadius: BorderRadius.circular(10)
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SvgPicture.asset(
//                 DesignConfiguration.setSvgPath(svgTag),color: AppColor.textColourDarkGray(context),),
//               Flexible(
//                 child: Text(title , textAlign: TextAlign.right, style: AppTextStyle.lSemiBold.copyWith(
//                     color: AppColor.textColourDarkGray(context)
//                 ),),
//               )
//             ],

//           ),
//           size.heightSpace(20),
//           CircularPercentIndicator(
//             backgroundColor: isLightTheme(context)?AppColor.lightWhiteColor:AppColor.DimGray.withOpacity(0.15),
//             radius: radius??60.0,
//             lineWidth: lineWidth??12.0,
//             animation: true,
//             percent: percentage,
//             center: GestureDetector(
//               onTap: (){
//                 textController!.text = '${controller.finalIdealWeight.value.substring(0,2)}';

//                 Get.bottomSheet(
//                     GoalBottomSheet(buttonText: 'Submit', title: title, onButtonClick: () {
//                   controller.idealWeightPercentage.value = double.parse(textController!.text)/100;
//                   controller.finalIdealWeight.value = textController!.text;
//                   Get.back();

//                   }, isLightTheme: isLightTheme(Get.context), controller: textController! ),backgroundColor: AppColor.backgroundColor(context));

//               },
//               child: Center(
//                 child: Text(
//                   centerTitle,
//                   style:
//                   AppTextStyle.lSemiBold.copyWith(
//                     color: AppColor.textColourDarkGray(context),
//                   ),textAlign: TextAlign.center,
//                 ),
//               ),
//             ),

//             circularStrokeCap: CircularStrokeCap.round,
//             progressColor: alertSigned??false?AppColor.redColor:AppColor.lightGreen,


//           ),
//         ],
//       ),
//     );
//   }
//   void setvalues(){
//     controller.idealWeightPercentage.value = double.parse(textController!.text)/100;
//     controller.finalIdealWeight.value = textController!.text;
//     Get.back();
//   }
// }

