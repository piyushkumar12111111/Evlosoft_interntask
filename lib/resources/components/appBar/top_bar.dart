
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../util/tools/design_configuration/design_configuration.dart';
// import '../../../util/tools/enums/home_enums.dart';
// import '../../colors/app_colors.dart';
// import '../../text_styles/text_styles.dart';
// import '../others/custom_cache_image.dart';



// class TopBar extends StatelessWidget {
//   const TopBar({
//     super.key, required this.isLightTheme, required this.size, required this.profileName, required this.isNotificationPresent, required this.chatOnClick, required this.onProfileClick, required this.onNotificationClick,
//   });

//   final bool isLightTheme;
//   final DynamicSize size;
//   final String profileName;
//   final bool isNotificationPresent;
//   final VoidCallback chatOnClick;
//   final VoidCallback onProfileClick;
//   final VoidCallback onNotificationClick;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         InkWell(
//           onTap: onProfileClick,
//           child: Padding(
//             padding: EdgeInsets.only(right: size.width(8)),
//             child: CustomCacheImage(
//               url: "",
//               height: size.height(45),
//               width: size.width(45),
//               shape: Shape.circle,
//               errorImage: ErrorImage.profile,
//               borderRadius: null,
//               isLightTheme: isLightTheme,
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 5,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Hello, $profileName👋",style: AppTextStyle.lRegular.copyWith(fontSize: 15,color: isLightTheme?AppColor.blackColor:AppColor.lightWhiteColor),),
//               Text("Welcome Back", style:
//               AppTextStyle.lSemiBold.copyWith(fontSize: 20,color: isLightTheme?AppColor.pureBlackColor:AppColor.whiteColor),),
//             ],
//           ),
//         ),
//         Expanded(
//           child: IconButton(
//             onPressed: chatOnClick,
//             icon: SvgPicture.asset(
//               DesignConfiguration.setSvgPath("chat-dots"),
//               height: size.height(24), // adjust the height as needed
//               width: size.width(24), // adjust the width as needed
//               color: isLightTheme?AppColor.pureBlackColor:AppColor.whiteColor, // set the color
//             ),
//           ),
//         ),
//         Expanded(
//           child: InkWell(
//             onTap: onNotificationClick,
//             child: Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 IconButton(
//                   onPressed: (){},
//                   icon: SvgPicture.asset(
//                     DesignConfiguration.setSvgPath("notification"), // replace with your SVG file path
//                     height: size.height(24), // adjust the height as needed
//                     width: size.width(24), // adjust the width as needed
//                     color: isLightTheme?AppColor.pureBlackColor:AppColor.whiteColor, // set the color
//                   ),
//                 ),
//                 if(isNotificationPresent)
//                   Positioned(
//                     left: size.width(25),
//                     top: size.height(8),
//                     child: Container(
//                       width: size.width(10),
//                       height: size.height(10),
//                       decoration: const BoxDecoration(
//                           color: AppColor.lightGreen,
//                           shape: BoxShape.circle
//                       ),
//                     ),
//                   )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
