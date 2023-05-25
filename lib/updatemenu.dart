import 'dart:ui';
import 'package:test/addnewdish.dart';
import 'package:test/deletedish.dart';
import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/updatedish.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    home: updatemenu(),
  ));
}

class updatemenu extends StatelessWidget {
  CollectionReference adminref=FirebaseFirestore.instance.collection('Admin_Data');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[700],
            title: Text('Update Menu',style: TextStyle(fontSize: 25),)
        ),
        body:Center(
          child: Stack(
            children: [
              Image.network(
                'https://thumbs.dreamstime.com/b/variety-popular-italian-food-white-background-top-view-variety-popular-italian-food-white-background-top-view-167922505.jpg',
                height:1500,
                width: 1200,
                fit: BoxFit.fill,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                    color: Colors.black.withOpacity(0)
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: 335,
                        width: 350,
                        child: Column(
                            children: [
                              Container(
                                height: 40,
                              ),
                              Container(
                                height: 50,
                                width: 270,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[700]
                                ),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      side: MaterialStateProperty.resolveWith((states) => BorderSide.none)
                                  ),
                                  onPressed: (){
                                    showDialog(context: context, builder: (BuildContext context){return addnewdish();});
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Add New Dish',style: TextStyle(fontSize: 18,color: Colors.white),),
                                      Icon(Icons.add_circle_outline,color: Colors.white,)
                                    ],
                                  )
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: 50,
                                width: 270,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[700]
                                ),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      side: MaterialStateProperty.resolveWith((states) => BorderSide.none)
                                  ),
                                  onPressed: (){
                                    showDialog(context: context, builder: (BuildContext context){return updatedish();});
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Update Dish',style: TextStyle(fontSize: 18,color: Colors.white),),
                                      Icon(Icons.system_update_alt_outlined,color: Colors.white,)
                                    ],
                                  )
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: 50,
                                width: 270,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey[700]
                                ),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                      side: MaterialStateProperty.resolveWith((states) => BorderSide.none)
                                  ),
                                  onPressed: (){
                                    showDialog(context: context, builder: (BuildContext context){return deletedish();});
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Delete Dish',style: TextStyle(fontSize: 18,color: Colors.white),),
                                      Icon(Icons.delete_forever,color: Colors.white,)
                                    ],
                                  )
                                ),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
          /*,*/
        )
    );
  }
}