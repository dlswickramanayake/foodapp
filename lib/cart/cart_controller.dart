import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'total_page.dart';

class mycontroller extends GetxController{
  var friedrice=0.obs;
  var sum=0.obs;


  increment(){
    friedrice.value++;
  }
  decrement(){
    if(friedrice.value<=0){
      Get.snackbar("buying products", "cannot be less than zero",
        icon: Icon(Icons.insert_emoticon),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 5),

      );
    }
    else{
      friedrice.value--;
    }
  }
}
