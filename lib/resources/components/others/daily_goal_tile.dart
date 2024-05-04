import 'package:flutter/material.dart';

import '../../text_styles/text_styles.dart';
import '../../colors/app_colors.dart';


class DailyGoalTile extends StatelessWidget {
  const DailyGoalTile({super.key, required this.goal, this.value, required this.onChange, required this.isLightTheme});
  final String goal;
final bool? value;
final Function(bool?) onChange;
final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              goal,
              textAlign: TextAlign.left,
              style: AppTextStyle.lRegular.copyWith(fontSize: 16,color: isLightTheme?AppColor.blackColor:AppColor.whiteColor),
            ),
          ),
        ],
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.green,
      checkColor: Colors.white,
      value: value,
      onChanged: onChange,
    );
  }
}
