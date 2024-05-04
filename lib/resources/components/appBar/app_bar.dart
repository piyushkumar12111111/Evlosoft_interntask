import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../colors/app_colors.dart';
import '../../text_styles/text_styles.dart';


AppBar getAppBar({
  required BuildContext context,
  required bool isLightTheme,
  required String title,
  VoidCallback? onBack,
  List<Widget>? actions,
}) {
  return AppBar(
    
    leading: InkWell(
      onTap: onBack ?? () => Get.back(),
      
      
      child: Container(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          height: 10,
          width: 10,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            )
        ),
      ),
    ),
    automaticallyImplyLeading: true,
    elevation: 10,
    title: Text(
      title,
      style: AppTextStyle.pRegular.copyWith(fontSize: 20),
    ),
    centerTitle: true,
    backgroundColor:
        isLightTheme ? AppColor.pureBlackColor : AppColor.pureBlackColor,
    actions: actions ?? [],

    
  );
}
