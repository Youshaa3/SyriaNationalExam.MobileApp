import 'package:syria_national_exam/core/data/models/apis/colleges_model.dart';
import 'package:syria_national_exam/core/data/models/apis/slider_model.dart';
import 'package:syria_national_exam/core/data/models/apis/specialization_model.dart';
import 'package:syria_national_exam/core/data/models/apis/subject_model.dart';
import 'package:syria_national_exam/core/data/reposotories/colleges_and_specializtions_repositories.dart';
import 'package:syria_national_exam/core/data/reposotories/home_repository.dart';

import 'package:syria_national_exam/core/data/reposotories/silder_repository.dart';
import 'package:syria_national_exam/core/enums/message_type.dart';
import 'package:syria_national_exam/core/enums/operation_type.dart';
import 'package:syria_national_exam/core/enums/request_status.dart';
import 'package:syria_national_exam/core/services/base_controller.dart';
import 'package:syria_national_exam/core/utils/general_utils.dart';
import 'package:syria_national_exam/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class HomePageController extends BaseController {
  RxList<SliderModel> sliderList = <SliderModel>[].obs;
  RxList<SpecializationsModel> specializationsList =
      <SpecializationsModel>[].obs;
  RxList<SpecializationsModel> filteredSpecializationsList =
      <SpecializationsModel>[].obs;
  RxList<SubjectModel> subjects = <SubjectModel>[].obs;
  RxList<CollegesModel> collegeList = <CollegesModel>[].obs;
  RxList<String> selectedColleges = <String>[].obs;
  RxString selectedCollege = "الكل".obs;
  RxInt selectedCollegeId = 0.obs;
  bool get isSubjectsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.SUBJECTS);
  int subbedSpecialization = 0;

  @override
  void onInit() {
    specializationsList.value = storage.getSpecializationsList();
    if (storage.isLoggedIn)
      subbedSpecialization = storage.getTokenInfo()!.specialization!.id!;
    getAllSliders();
    getAllColleges();
    super.onInit();
  }

  bool subbedCollege({
    required int index,
  }) {
    return storage.getTokenInfo()!.specialization!.id! ==
        filteredSpecializationsList[index].id;
    // return storage.getCollegeLogin()!.uuid == specializationsList[index].uuid!;
  }

  void getAllSliders() {
    runFutureFunctionWithLoading(
      function: SliderRepository().getAllSliders().then(
        (value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            sliderList.addAll(r);
            CustomToast.showMessage(
              message: "Success",
              messageType: MessageType.SUCCESS,
            );
          });
        },
      ),
    );
  }

  Future getAllColleges() {
    return runFutureFunctionWithLoading(
      function: CollegesAndSpecializtionsRepositories().getAllColleges().then(
        (value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            collegeList.clear();
            collegeList.addAll(r);
            getSpecializationspByCollege(0);
            CustomToast.showMessage(
              message: "Success",
              messageType: MessageType.SUCCESS,
            );
          });
        },
      ),
    );
  }

  Future<void> getSpecializationspByCollege(int collegeId) async {
    //filteredspecializationsList.clear();
    if (collegeId == 0) {
      filteredSpecializationsList.value = specializationsList.value;
    } else {
      filteredSpecializationsList.value =
          specializationsList.where((specializations) {
        return specializations.collageId == collegeId;
      }).toList();
    }
  }

  Future<void> getMasterSubjects() async {
    return runFutureFunctionWithLoading(
        operationType: OperationType.SUBJECTS,
        function: HomeRepository().getSubjects(master: true).then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l), (r) {
              subjects.clear();
              subjects.addAll(r);
            })));
  }

  Future<void> getGraduationSubjects() async {
    return runFutureFunctionWithLoading(
        operationType: OperationType.SUBJECTS,
        function: HomeRepository().getSubjects(graduation: true).then((value) =>
            value.fold((l) => CustomToast.showMessage(message: l), (r) {
              subjects.clear();
              subjects.addAll(r);
            })));
  }

  Future<void> getSubjects({required int specialID}) async {
    return runFutureFunctionWithLoading(
        operationType: OperationType.SUBJECTS,
        function: HomeRepository().getSubjects(specialID: specialID).then(
            (value) =>
                value.fold((l) => CustomToast.showMessage(message: l), (r) {
                  subjects.clear();
                  subjects.addAll(r);
                })));
  }
}
