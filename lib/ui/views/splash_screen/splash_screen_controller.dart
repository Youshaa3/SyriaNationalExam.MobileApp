import 'package:syria_national_exam/core/data/reposotories/colleges_and_specializtions_repositories.dart';
import 'package:syria_national_exam/core/enums/message_type.dart';
import 'package:syria_national_exam/core/services/base_controller.dart';
import 'package:syria_national_exam/core/utils/general_utils.dart';
import 'package:syria_national_exam/ui/shared/custom_widgets/custom_toast.dart';
import 'package:syria_national_exam/ui/views/login_view/login_view.dart';
import 'package:syria_national_exam/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      getCollege();
    });
    super.onInit();
  }

  void getCollege() {
    CollegesAndSpecializtionsRepositories.getAllSpecializtions().then((value) {
      value.fold((l) {
        // isLoding.value = false;
        CustomToast.showMessage(
          messageType: MessageType.REJECTED,
          message: l,
        );
      }, (r) {
        storage.setSpecializationsList(r);
        storage.isLoggedIn
            ? Get.off(() => MainView())
            : Get.off(() => LoginView());
      });
    });
  }
}
