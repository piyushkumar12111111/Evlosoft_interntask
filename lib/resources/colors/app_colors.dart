import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'debug_tools.dart';


class AppColor{



static Color backgroundColor(context) => Theme.of(context).scaffoldBackgroundColor;
static Color textColor(context) => Theme.of(context).hintColor;
static Color widgetPrimaryColor(context) => Theme.of(context).primaryColor;


static Color textColourDarkGray(context) => !isLightTheme(context) ? const Color(0xffffffff) : const Color(0xff4d4d4d);
static Color textFieldBackgroundColour(context) => !isLightTheme(context) ? const Color(0xff080808) : const Color(0xffD6D6D6);
static Color textColourDarkBlack(context) => !isLightTheme(context) ? const Color(0xffffffff) : const Color(0xff000000);
static Color containerColor(context) => !isLightTheme(context) ? const Color(0xff000000) : const Color(0xffF5F5F5);
static Color notificationColor(context) => !isLightTheme(context) ? const Color(0xff000000) : const Color(0xffEDF3FF);
static Color declinebuttonColor(context) => !isLightTheme(context) ? const Color(0xff000000) : const Color(0xffffffff);



static Color textFieldTextColour = const Color(0xff4d4d4d);
static Color lightGreenButton = const Color(0xff385127);
static const buttonColorLight = Color(0xffD6D6D6);
static const iconColorLight = Color(0xff544c4c);
static const buttonColorDark = Color(0xff080808);
static const whiteColor = Color(0xffffffff);
static const pureBlackColor = Color(0xff000000);
static const transparentColor = Colors.transparent;
static const blackColor = Color(0xff171717);
static const lightGreen = Color(0xff67bc2a);
static const mediumGreen = Color(0xff509613);
static const darkGreen = Color(0xff03632c);
static const lightGrey = Color(0xfff5f5f5);
static const darkGrey = Color(0xffc7c7c7);
static const charcoalGrey = Color(0xff4d4d4d);
static const yellowColor = Color(0xffF9AE1C);
static const redColor = Color(0xffAA0000);
static const bottomNavColor = Color(0xffD5E6FF);
static const lightWhiteColor = Color(0xffd9d9d9);
static const middarkgrey = Color(0xffC6C6C8);
static const lightblack = Color(0x80000000);
static const charcoalblack = Color(0xff3A4750);
static const mediumgrey = Color(0xffABABABF);
static const yellowaccent = Color(0xffFDE99D);
static const pinkaccent = Color(0xffFFD8F4);
static const blueaccent = Color(0xffD9E8FC);
static const rockblue = Color(0xff94A3B8);
static const davygrey = Color(0xff575A61);
static const seagreen = Color(0xff079945);
static const DimGray = Color(0xff696969);
static const grey = Color(0xff858585);
static const greenaccent = Color(0xffD7FFB8);
static const orangeAccent = Color(0xffFFEADD);
static const darkbluecolor = Color(0xff667085);
static const gray85 = Color(0xff667085);
static const purpleColor = Color(0xff6941C6);
static const mantisGreenColor = Color(0xff7AC143);
static const redColorAccent = Color(0xffff0000);
static const fatGoldColor = Color(0xffE8B903);
static const fortessGrey = Color(0xffB7B7B7);
static const leaveGreen = Color(0xff219D16);
static const aluminiumGreyColor = Color(0xff868889);
static const spanishGreyColor = Color(0xff979899);
static const grey63Color = Color(0xffA1A1A1);
static const orangeColor = Color(0xffFF8B20);
static const blueColor = Color(0xff3A86FF);
static const heatherGreyColor = Color(0xffADB5BD);
static const grey75Color = Color(0xffBFBFBF);
static const greenBackgroundColor = Color(0xffF2FAF0);
static const greyBlueColor = Color(0xffE2E8F0);
static const slateGreyColor = Color(0xff73839B);





 static  ThemeData darkTheme = ThemeData(
    hintColor: whiteColor, // For Text Colors
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackColor, // For Scaffold Colors
    primaryColor: pureBlackColor, // For Widget Colors
    fontFamily: "Lato",
    buttonTheme: const ButtonThemeData(
      buttonColor: lightGreen,
      disabledColor: whiteColor,
    ));

static ThemeData lightTheme = ThemeData(
    hintColor: blackColor, // For Text Colors
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor, // For Scaffold Colors
    primaryColor: whiteColor, // For Widget Colors
    fontFamily: "Lato",
    buttonTheme: const ButtonThemeData(
      buttonColor: darkGreen,
      disabledColor: blackColor,
    ));
}

