import 'package:syria_national_exam/core/enums/bottom_Navigation.dart';
import 'package:syria_national_exam/core/services/base_controller.dart';
import 'package:get/get.dart';

class BottomNavigationController extends BaseController {
  BottomNavigationController(BottomNavigationEnum type) {
    enumType.value = type;
  }
  Rx<BottomNavigationEnum> enumType = BottomNavigationEnum.HOME.obs;
}
