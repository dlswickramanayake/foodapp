import 'package:get/get.dart';

import 'package:test/api/apidata.dart';

class TodayProduactRep extends GetxService{
  final ApiClient apiClient;
  TodayProduactRep({required this.apiClient});

  Future<Response> getTodayProductList() async{
    return await apiClient.getData("end Point url");
  }
}