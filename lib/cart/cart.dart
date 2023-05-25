import 'cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:test/cart/total_page.dart';

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
        title: Text("Cart"),
        leading: Icon(Icons.home,size: 25,),
        backgroundColor:Colors.transparent,
        elevation: 0,
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
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://houseofnasheats.com/wp-content/uploads/2023/01/Chicken-Fried-Rice-Recipe-Square-1.jpg'),
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
                      Text('Rs.350',style: TextStyle(fontSize: 16),)
                    ],
                  ),
                  Expanded(child: Container()),
                  Text('Quantity = 2',style: TextStyle(fontSize: 16),),
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
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://houseofnasheats.com/wp-content/uploads/2023/01/Chicken-Fried-Rice-Recipe-Square-1.jpg'),
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
                      Text('Rs.450',style: TextStyle(fontSize: 16),)
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

    );
  }
}

