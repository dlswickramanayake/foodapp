import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    home: addnewdish(),
  )
  );
}

late String dishname;
late int price;
late String description;

class addnewdish extends StatelessWidget {
  final TextEditingController _controller=TextEditingController();
  final TextEditingController _controller1=TextEditingController();
  final TextEditingController _controller2=TextEditingController();

  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add New Dish'),
            SizedBox(height: 20,),
            TextFormField(
              controller: _controller,
              onChanged: (value){
                dishname=value;
              },
              decoration: InputDecoration(
                hintText:'Dish Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _controller1,
              onChanged: (value1){
                price=int.tryParse(value1)!;
              },
              decoration: InputDecoration(
                hintText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _controller2,
              onChanged: (value3){
                description=value3;
              },
              decoration: InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    child: Text('Submit'),
                    onPressed: (){
                      _controller.clear();
                      _controller1.clear();
                      _controller2.clear();
                      CollectionReference add = FirebaseFirestore.instance.collection('Food_Data');
                      add.add({
                        'Dish_Name':dishname,
                        'Price':price,
                        'Description':description
                      }
                      ).then((value){
                        Fluttertoast.showToast(
                            msg: "Data saved successfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      });
                    }
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: Text('Close'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
