
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../tools/design_configuration/design_configuration.dart';
import '../../../tools/enums/home_enums.dart';


import 'package:cached_network_image/cached_network_image.dart';

import '../../colors/app_colors.dart';  


class CustomCacheImage extends StatelessWidget {
  const CustomCacheImage(
      {super.key,
      required this.url,
      this.borderRadius,
      required this.height,
      required this.width,
      required this.shape,
      required this.errorImage,
      required this.isLightTheme,
      this.iconSize});

  final String url;
  final double height;
  final double width;
  final Shape shape;
  final ErrorImage errorImage;
  final BorderRadius? borderRadius;
  final bool isLightTheme;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return url.trim().isNotEmpty
        ? CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: shape == Shape.circle
                        ? null
                        : borderRadius ??
                            const BorderRadius.all(Radius.circular(12)),
                    shape: shape == Shape.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  shape: shape == Shape.circle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  color:
                      isLightTheme ? AppColor.blackColor : AppColor.whiteColor,
                  borderRadius: shape == Shape.circle
                      ? null
                      : borderRadius ??
                          const BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: errorImage == ErrorImage.profile
                        ? Icon(
                            Icons.person,
                            color: isLightTheme
                                ? AppColor.whiteColor
                                : AppColor.blackColor,
                            size: iconSize,
                          )
                        : ErrorImage.story == errorImage
                            ? SvgPicture.asset(
                                DesignConfiguration.setSvgPath('wz_head'))
                            : Icon(
                                Icons.error,
                                color: isLightTheme
                                    ? AppColor.whiteColor
                                    : AppColor.blackColor,
                                size: iconSize,
                              ))))
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape:
                  shape == Shape.circle ? BoxShape.circle : BoxShape.rectangle,
              color: ErrorImage.story == errorImage
                  ? isLightTheme
                      ? AppColor.whiteColor
                      : AppColor.blackColor
                  : isLightTheme
                      ? AppColor.blackColor
                      : AppColor.whiteColor,
              borderRadius: shape == Shape.circle
                  ? null
                  : borderRadius ?? const BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: errorImage == ErrorImage.profile
                    ? Icon(
                        Icons.person,
                        color: isLightTheme
                            ? AppColor.whiteColor
                            : AppColor.blackColor,
                        size: iconSize,
                      )
                    : ErrorImage.story == errorImage
                        ? SvgPicture.asset(
                            DesignConfiguration.setSvgPath('wz_head'))
                        : Icon(
                            Icons.error,
                            color: isLightTheme
                                ? AppColor.whiteColor
                                : AppColor.blackColor,
                            size: iconSize,
                          )));
  }
}
