import 'package:syria_national_exam/core/data/network/network_config.dart';

class EndpoinNotifictionts {
  static String notifictionUpdate =
      NetworkConfig.getFullApiRoute('dashboard/Notification/update');
  static String getAllNotifiction =
      NetworkConfig.getFullApiRoute('dashboard/Notification/getall');
}
