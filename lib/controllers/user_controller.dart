import 'package:flutter_app_test/models/user_model.dart';
import 'package:flutter_app_test/services/user_data_service.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class UserController extends GetxController {
  var allData = <UserData>[].obs;
  var isLoading = true.obs;
  int get fine => (totalBreakfastPending!+totalLunchPending!+totalDinnerPending!)*100;

  int? get totalBreakfastPending {
    int a = 0;
    allData[0].reports?.forEach((element) {
      if (element.optIns.toString() != '[]') {
        if (element.optIns['breakfast'] == 'Pending') {
          a++;
        }
      }
    });
    return a;
  }

  int? get totalLunchPending {
    int a = 0;
    allData[0].reports?.forEach((element) {
      if (element.optIns.toString() != '[]') {
        if (element.optIns['lunch'] == 'Pending') {
          a++;
        }
      }
    });
    return a;
  }

  int? get totalDinnerPending {
    int a = 0;
    allData[0].reports?.forEach((element) {
      if (element.optIns.toString() != '[]') {
        if (element.optIns['dinner'] == 'Pending') {
          a++;
        }
      }
    });
    return a;
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  void fetchAllData() async {
    try {
      isLoading(true);
      var dataList = await UserDataService.fetchAllData();
      if (dataList != null) {
        allData.add(dataList);
      }
    } finally {
      isLoading(false);
    }
  }
}
