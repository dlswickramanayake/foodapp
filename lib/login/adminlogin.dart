import 'package:flutter/material.dart';
import 'package:test/adminhome.dart';
import 'package:test/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/adminhome.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    home: adminlogin(),
  ));
}

class adminlogin extends StatefulWidget {
  const adminlogin({Key? key}) : super(key: key);

  @override
  State<adminlogin> createState() => _loginPageState();
}

class _loginPageState extends State<adminlogin> {

  final unamecontroller=TextEditingController();
  final passcontroller=TextEditingController();

  void signIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: unamecontroller.text,
        password: passcontroller.text,
    );
  }

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
              Text('Use Admin Credentials !',
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
                    controller: unamecontroller,
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
                    controller: passcontroller,
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
                  onPressed: (){
                    signIn();
                    if(mounted){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Top() ));
                    }
                  },
                  child: Text("Sign in",style: TextStyle(fontSize: 16),),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You an User?'),
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context, MaterialPageRoute(builder: (context) =>loginPage() ));
                      },
                      child: Text('Login as a User',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),)
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
