import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test/home/mainhome.dart';
import 'package:test/login/adminlogin.dart';
import 'package:test/main.dart';
import 'package:test/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
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

  Future<UserCredential?> signInWithGoogle() async {
    // Create an instance of the firebase auth and google signin
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //Triger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    //Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Sign in the user with the credentials
    final UserCredential userCredential =
    await auth.signInWithCredential(credential);
    return null;
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
              Text('Welcome Back !',
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),

              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: 250,
                    child: ElevatedButton.icon(
                      onPressed: ()async{
                        await signInWithGoogle();
                        if(mounted){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>MyApp() ));
                        }
                      },
                      icon: Image.asset(
                        'assets/google.png',
                        width: 25.0,
                        height: 25.0,
                      ),
                      label: Text('Continue with Google'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                    ),
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  TextButton(
                      style: TextButton.styleFrom(
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
