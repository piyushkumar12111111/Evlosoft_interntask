import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../colors/app_colors.dart';
import '../../text_styles/text_styles.dart';
import '../textFields/text_field.dart';



class GoalBottomSheet extends StatelessWidget {
  const GoalBottomSheet({super.key, required this.buttonText, required this.title, required this.onButtonClick, required this.isLightTheme, required this.controller});
  final String buttonText;
  final String title;
  final VoidCallback onButtonClick;
  final bool isLightTheme;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: AppTextStyle.lSemiBold.copyWith(fontSize: 24,color: isLightTheme?AppColor.blackColor:AppColor.whiteColor),),
                IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.close,color: isLightTheme?AppColor.blackColor:AppColor.whiteColor,))
              ],
            ),
            const SizedBox(height: 30,),
            CustomTextField(
              controller: controller,
              isLightMode: isLightTheme,
              hintText: "Write here...",
              maxLines: 5,
            ),
            const SizedBox(height: 20,),
          //  CustomElevatedButton(onPressed: onButtonClick, label: buttonText),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}
