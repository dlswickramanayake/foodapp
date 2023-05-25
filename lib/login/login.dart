import 'package:flutter/material.dart';
import 'package:test/adminhome.dart';
import 'package:test/login/adminlogin.dart';
import 'package:test/registration.dart';

main(){
  runApp(MaterialApp(
    home: loginPage(),
  ));
}

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:SafeArea(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login_sharp,
                size: 100,
              ),
              Text('Hello!',
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Text('Welcome Back !',
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color:Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration (
                      border: InputBorder.none,
                      hintText: '  Email',

                    ),
                  ),
                ),
              ),
              SizedBox(height:10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color:Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration (
                      border: InputBorder.none,
                      hintText: '  Password',

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 40)
                  ),
                  onPressed: (){},
                  child: Text("Sign in",style: TextStyle(fontSize: 16),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 0)
                    ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>RegistrationFormUI() ));
                      },
                      child: Text('Register Now',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You an Admin?'),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(0, 0)
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>adminlogin() ));
                    },
                    child: Text('Login as a Admin',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),)
                  )
                ],
              )

            ],
          ),
        ) ,
      ),
    );

  }
}
