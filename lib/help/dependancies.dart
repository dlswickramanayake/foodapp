import 'package:test/api/apidata.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:test/controllers/todaycontroller.dart';
import 'package:test/repository/toadyrepo.dart';

Future<void> init()async {

  Get.lazyPut(()=>ApiClient(appBaseUrl: "url"));//api client

  Get.lazyPut(()=>TodayProduactRep(apiClient:Get.find()));//rep

  Get.lazyPut(()=>TodayProductController(todayProduactRep:Get.find()));//controller
}