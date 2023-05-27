import 'package:test/test2.dart';
import 'cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:test/cart/total_page.dart';
import 'package:test/utility/dimentions.dart';
import 'package:test/cart/widgets/bigtext.dart';
import 'package:fluttertoast/fluttertoast.dart';


main(){
  runApp(MaterialApp(
    home: MyCart(),
  ));
}
class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  final mycontroller c = Get.put(mycontroller());

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart",style: TextStyle(fontSize: 25.0),),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp() ));
          },
          icon: Icon(Icons.home),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:LinearGradient(colors:[
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 232),
              Color.fromARGB(255, 131, 123, 232),
              Color.fromARGB(255, 104, 132, 231),
            ]
            ),
          ),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          children: [
            Dismissible(
              key: Key('item_1'),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                });
              },
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.purpleAccent,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/chicken-rice.jpg",
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        'Fried rice',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text('Rs.450',style: TextStyle(fontSize: 16),)
                    ],
                  ),
                  Expanded(child: Container()),
                  Text('Quantity = 1',style: TextStyle(fontSize: 16),),
                ],
              ),

            ),
            SizedBox(height: 20,),
            Dismissible(
              key: Key('item_2'),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                });
              },
              background: Container(
                alignment: Alignment.centerRight,
                color: Colors.purpleAccent,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/kottu-1.jpg",
                        ),
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Kottu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text('Rs.500',style: TextStyle(fontSize: 16),)
                    ],
                  ),
                  Expanded(child: Container()),
                  Text('Quantity = 1',style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ],
        ),

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
                  SizedBox(width: Dimensions.width20,),
                  BigText(text: "Total = Rs.950"),
                  SizedBox(width: Dimensions.width20,),
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
                      msg: "Order Confirmed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                },
                child: Text('Confirm Order',style: TextStyle(fontSize: 16.0),),
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

