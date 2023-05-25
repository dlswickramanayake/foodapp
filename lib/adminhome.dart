import 'dart:ui';
import 'package:test/manageorders.dart';
import 'package:test/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test/login/login.dart';
import 'package:test/updatemenu.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    home: Top(),
  ));
}

class Top extends StatelessWidget {
  CollectionReference adminref=FirebaseFirestore.instance.collection('Admin_Data');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[700],
        title: Text('Welcome!!',style: TextStyle(fontSize: 25),)
      ),
      endDrawer: Drawer(
        child: Container(
          color: Colors.grey[700],
          child: ListView(
            children: [
              Container(
                height: 70,
                child:Row(
                  children: [
                    Icon(Icons.account_circle,size: 60,),
                    SizedBox(
                      width: 65,
                    ),
                    Container(
                      height: 40,
                      child: OutlinedButton(
                        onPressed: (){
                          showDialog(context: context, builder: (BuildContext context){return loginPage();});
                        },
                        child: Text('Logout',style: TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                    )
                  ],
                ) ,
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                leading: OutlinedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return MyDialog();
                      }
                    );
                  },
                  child: Text('Create New Admin Account',style: TextStyle(fontSize: 18,color: Colors.white),),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    side: MaterialStateProperty.all(BorderSide.none)
                  ),
                ),
                trailing: Icon(Icons.add_box_rounded,size: 40,),
                onTap: (){},
              ),
              ListTile(
                leading: OutlinedButton(
                  onPressed: (){},
                  child: Text('Update Password',style: TextStyle(fontSize: 18,color: Colors.white),),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    side: MaterialStateProperty.all(BorderSide.none)
                  ),
                ),
                trailing: Icon(Icons.password_outlined,size: 40,),
                onTap: (){},
              )
            ],
          ),
        ),
      ),
      body: Center(
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
                      height: 400,
                      width: 350,
                      child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('Admin Tools',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>MyListPage() ));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //Text('Manage Orders',style: TextStyle(fontSize: 18,color: Colors.white),),
                                  children: [
                                    Text('Manage Orders', style: TextStyle(fontSize: 18,color: Colors.white)),
                                    Icon(Icons.manage_search_rounded,color: Colors.white,),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => updatemenu()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Update Menu',style: TextStyle(fontSize: 18,color: Colors.white),),
                                    Icon(Icons.update_rounded,color: Colors.white,)
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
                                onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Manage Reviews',style: TextStyle(fontSize: 18,color: Colors.white),),
                                    Icon(Icons.manage_accounts_outlined,color: Colors.white,)
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
      )
    );
  }
}