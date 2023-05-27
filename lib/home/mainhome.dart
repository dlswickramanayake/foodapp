import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/cart/cart.dart';
import 'package:test/cart/widgets/bigtext.dart';
import 'package:test/cart/widgets/smalltext.dart';
import 'package:test/utility/dimentions.dart';
import 'package:test/home/foddpagebody.dart';
import 'package:google_sign_in/google_sign_in.dart';



class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

Future<void> logout() async {
  final GoogleSignIn googleSign = GoogleSignIn();
  await googleSign.signOut();
}


class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "UniFood"
                        ,color: Colors.blue[300],),
                      Row(
                        children: [
                          SmallText(text: "Dinner",color: Colors.black,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height75,
                      height: Dimensions.height45,
                      child: IconButton(
                        onPressed: ()async{
                          await logout();
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>MyCart() ));
                        },
                        icon: Icon(
                            Icons.shopping_cart
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius45),
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
