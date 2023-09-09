import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syria_national_exam/ui/shared/colors.dart';
import 'package:syria_national_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:syria_national_exam/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:get/get.dart';

import '../../shared/utils.dart';
import 'about_controller.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  AboutController controller = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [SvgPicture.asset('assets/svgs/about_app.svg')],
          ),
          (screenWidth(30)).ph,
          Obx(() => controller.textShow.isEmpty
              ? SpinKitCircle(
                  color: AppColors.darkPurpleColor,
                )
              : controller.errorGet.value
                  ? CustomText(
                      textType: TextStyleType.BODY, text: controller.errorText)
                  : Column(
                      children: List.generate(
                          controller.textShow.length,
                          (index) => CustomText(
                                text: controller.textShow[index],
                                textType: TextStyleType.SUBTITLE,
                              )),
                    )),
        ],
      ),
    );
  }
}
