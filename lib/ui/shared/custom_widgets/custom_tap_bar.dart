import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syria_national_exam/ui/shared/colors.dart';
import 'package:syria_national_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:syria_national_exam/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:syria_national_exam/ui/shared/utils.dart';
import 'package:get/get.dart';

//! -- This Custom File can use in Login & Register views

class CustomTapBar extends StatelessWidget {
  final String title;
  final String? iconName;
  final String? imageName;

  const CustomTapBar({
    super.key,
    required this.title,
    this.iconName,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (screenHeight(25)).ph,
        Row(
          mainAxisAlignment: iconName != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (iconName != null) ...[
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset("assets/svgs/$iconName.svg")),
            ],
            CustomText(
              textType: TextStyleType.TITLE,
              text: title,
              textColor: AppColors.darkGreyColor,
            ),
            (screenWidth(20)).pw,
          ],
        ),
        (screenHeight(25)).ph,
        if (imageName != null) ...[
          SvgPicture.asset("assets/svgs/$imageName.svg")
        ],
        (screenHeight(25)).ph,
      ],
    );
  }
}
