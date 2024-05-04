import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../tools/design_configuration/design_configuration.dart';
import '../../colors/app_colors.dart';
import '../../colors/debug_tools.dart';
import '../../text_styles/text_styles.dart';




class BottomNavbar extends StatefulWidget {

  const BottomNavbar({super.key, required this.changeIndex, required this.getCurrentIndex, required this.listOfStrings, required this.listOfIcons,});

  final Function changeIndex;
  final Function getCurrentIndex;
  final List listOfStrings;
  final List listOfIcons;

  @override
  BottomNavbarState createState() => BottomNavbarState();
}

class BottomNavbarState extends State<BottomNavbar> {
  var currentIndex =0;

  @override
  void initState() {
    setState(() {
      currentIndex = widget.getCurrentIndex();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: isLightTheme(context)?AppColor.bottomNavColor:AppColor.pureBlackColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              widget.changeIndex(index);
              HapticFeedback.lightImpact();
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex
                    ? displayWidth * .32
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == currentIndex ? displayWidth * .12 : 0,
                  width: index == currentIndex ? displayWidth * .32 : 0,
                  decoration: BoxDecoration(
                    color: index == currentIndex
                        ? AppColor.lightGreen
                        : AppColor.transparentColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex
                    ? displayWidth * .31
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex ? displayWidth * .13 : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == currentIndex ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == currentIndex
                                ? widget.listOfStrings[index]
                                : '',
                            style: AppTextStyle.lSemiBold.copyWith(
                              fontSize: 14,
                              color: index == currentIndex?AppColor.blackColor:AppColor.textColor(context)
                            )
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex ? displayWidth * .025 : 20,
                        ),
                        SvgPicture.asset(
                          DesignConfiguration.setSvgPath(widget.listOfIcons[index]),
                          height: index==2?displayWidth* .06:displayWidth * .076,
                          color: index == currentIndex?AppColor.blackColor:AppColor.textColor(context), // Set both active and inactive color to black
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
