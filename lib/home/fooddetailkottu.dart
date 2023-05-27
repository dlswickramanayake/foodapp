import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/test2.dart';
import 'package:test/cart/widgets/appcolumn.dart';
import 'package:test/cart/widgets/bigtext.dart';
import 'package:test/cart/widgets/expendabletext.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/utility/dimentions.dart';
import 'package:test/cart/widgets/appicon.dart';

class TodayFoodDetailkottu extends StatelessWidget {
  const TodayFoodDetailkottu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.TodayFoodImageSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/kottu-1.jpg"),

                  )),
            ),
          ),

          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width10,
            right: Dimensions.width10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.pop(context, MaterialPageRoute(builder: (context) =>MyApp() ));
                  },
                  icon: Icon(Icons.arrow_back),
                )
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.TodayFoodImageSize-20,
            child: Container(

              padding: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20,)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Kottu"),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "about"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                          "One portion of Chicken kottu suit for 1 person.make with delicious special sources.And chili paste make it even tastier."),
                    ),
                  )
                ],
              ),
            ),),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top:Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width10, right: Dimensions.width10),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: Colors.black,),
                  SizedBox(width: Dimensions.width20,),
                  BigText(text: "1"),
                  SizedBox(width: Dimensions.width20,),
                  Icon(Icons.add, color: Colors.black,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width10,right: Dimensions.width10),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: (){
                  Fluttertoast.showToast(
                      msg: "Added To Cart",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: Text('Rs.450  |  Add to Cart',style: TextStyle(fontSize: 16.0),),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((Dimensions.radius20),),
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
