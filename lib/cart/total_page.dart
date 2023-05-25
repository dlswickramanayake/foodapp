import 'package:flutter/cupertino.dart';
import 'package:test/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/cart/cart_controller.dart';

main(){
  runApp(MaterialApp(
    home: TotalPage(),
  ));
}

class TotalPage extends StatelessWidget {
  TotalPage({Key? key}) : super(key: key);

  final mycontroller c = Get.put(mycontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
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
      drawer:Drawer(child: ListView(children:[


        DrawerHeader(
          child: Center(
            child:Container(
              height: 140,
              width: 140,
              child:CircleAvatar(
                backgroundImage:
                NetworkImage('https://cdn.hovia.com/app/uploads/Food-and-Wine-Chalkboard-Wallpaper-Mural-Plain.jpg'),
              ),
            ),
          ),
        ),


        ListTile(
          title: IconButton(
            icon:const Icon(Icons.home),
            onPressed: (){},
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          title:   IconButton(
            icon:const Icon(Icons.notifications),
            onPressed: (){} ,
          ),

          onTap: (){
            Navigator.pop(context);
          },
        ),
        ListTile(
          title:          IconButton(
            icon:const Icon(Icons.notifications),
            onPressed: (){} ,
          ),

          onTap: (){
            Navigator.pop(context);
          },
        ),

      ]
      ),
      ) ,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'total items',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              // obx(() => Text("${c.sum.toString()}")),

              SizedBox(width: 20),
              Obx(() => Text("${c.friedrice.toString()}",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              ),


              SizedBox(height: 20),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey,
                ),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => MyCart()),
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  obx(Text Function() param0) {}
}

