
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/login_register/signUP.dart';

import '../homelayout.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(

            child: Form(
              key: formKey,
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Login",style: TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email addres must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.email,color: Color.fromRGBO(75, 91, 91, 1.0),
                          ),

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),



                        ),


                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText:ispassword? true : false,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password must  not be empty ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color.fromRGBO(75, 91, 91, 1.0),
                          ),
                          suffixIcon:ispassword? IconButton(
                            icon: Icon(
                              Icons.visibility_off,
                              color: Color.fromRGBO(75, 91, 91, 1.0),
                            ),
                            onPressed: (){
                              setState(()
                              {
                                ispassword =! ispassword;
                              });
                            },
                          ) :IconButton(
                            icon: Icon(
                              Icons.visibility,
                              color: Color.fromRGBO(75, 91, 91, 1.0),
                            ),
                            onPressed: (){
                              setState(()
                              {
                                ispassword =! ispassword;
                              });
                            },
                          ) ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),



                        ),


                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(
                            27, 136, 136, 1.0),),
                        child:MaterialButton(
                          child: Text("login"),
                          onPressed: ()async{
                            if (formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              var result = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                              if (result != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeLayout()),

                                );
                              } else {

                                print("user not found");
                              }

                            }
                            ;


                          },
                        ),

                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      //sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signupScreen()),
                            );
                          },
                            child: Text('Sign Up',style: TextStyle(color:Color.fromRGBO(
                                6, 139, 162, 1.0),)),
                          ),

                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}