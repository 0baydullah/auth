import 'conf.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _name =TextEditingController();
  TextEditingController _pass =TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _pass.dispose();
    super.dispose();
  }


  // register()async{
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   final  User? user = (await firebaseAuth.createUserWithEmailAndPassword(email: mail, password: name)).user;
  //   if(user!=null){
  //     Navigator.push(context,
  //         MaterialPageRoute(
  //             builder: (context) => Home() ),
  //     );
  //   }
  // }

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff0cf9ff),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 69,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelText: "Name",
                      icon: Icon(
                        Icons.person,
                        size: 65,
                      ),
                      iconColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _pass,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value!)) {
                        return "Enter Correct Email Address";
                      } else
                        return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      icon: Icon(
                        Icons.mail,
                        size: 65,
                      ),
                      iconColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _signUp,
                      child: Text("Sign Up"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp()async{
    String namea = _name.text;
    String passa = _pass.text;

    User? user = await _auth.signUpWithEmailAndPassword(namea, passa);
    if(User!=null){
      print("user done");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
    }
  }
}
