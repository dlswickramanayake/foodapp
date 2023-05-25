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
    home: MyDialog(),
  )
  );
}

late String username;
late String password;

class MyDialog extends StatelessWidget {
  final TextEditingController _controller=TextEditingController();
  final TextEditingController _controller1=TextEditingController();

  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add New Admin'),
            SizedBox(height: 20,),
            TextFormField(
              controller: _controller,
              onChanged: (value){
                username=value;
              },
              decoration: InputDecoration(
                hintText:'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: _controller1,
              onChanged: (value1){
                password=value1;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: (){
                    _controller.clear();
                    _controller1.clear();
                    CollectionReference add = FirebaseFirestore.instance.collection('Admin_Data');
                    add.add({
                      'Username':username,
                      'Password':password
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
