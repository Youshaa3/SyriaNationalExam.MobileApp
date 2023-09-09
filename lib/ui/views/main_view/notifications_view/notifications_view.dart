import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syria_national_exam/ui/shared/custom_widgets/custom_text.dart';
import 'package:syria_national_exam/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:get/get.dart';

import '../../../shared/utils.dart';
import 'notifications_controller.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(15)),
        child: Column(
          children: [
            (screenWidth(2.8)).ph,
            Center(
              child: SvgPicture.asset("assets/svgs/img_notifications.svg"),
            ),
            (screenWidth(18)).ph,
            CustomText(
              text: "الإشعارات",
              textType: TextStyleType.TITLE,
            ),
            (screenWidth(20)).ph,
            CustomText(
              textType: TextStyleType.BODY,
              text:
                  'أبقى على إطلاع بمواعيد الإمتحان الوطني\n صدور النتائج، إضافة أسئلة، والكثير من\n الأخبار',
            ),
            // Column(children: List.generate(length, (index) => null),)
            (screenWidth(20)).ph,
          ],
        ),
      )
    ]);
  }
}
