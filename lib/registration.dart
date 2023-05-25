import 'package:flutter/material.dart';
import 'package:test/login/login.dart';

main(){
  runApp(MaterialApp(
    home: RegistrationFormUI(),
  ));
}

class RegistrationFormUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text('Registration Form'),
        leading: Icon(Icons.app_registration,size: 25,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(

                      ),
                      SizedBox(height: 50),
                      Text(
                        'Name',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Confirm Password',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {},
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            child: Text('Submit'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>loginPage() ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      );
  }
}