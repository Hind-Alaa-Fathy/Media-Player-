
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import '../homelayout.dart';
import 'login.dart';

class signupScreen extends StatefulWidget {
  signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future signUp() async {
      String uid = "";
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
          .then((value) {
        uid = value.user!.uid;
        FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .set(<String, dynamic>{
          "name": nameController.text,
          "E-mail": emailController.text,
        }).then((value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Auth(),
              ));
        });
      });

  }
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
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
                  // Image(image: AssetImage("images/logo.png"),
                  //   width: 200,
                  //   height: 200,
                  // ),

                  //Sign Up text
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Sign Up",style: TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      //name
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(
                            Icons.perm_identity,color: Color.fromRGBO(75, 91, 91, 1.0),
                          ),

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),



                        ),


                      ),
                      SizedBox(height: 20,),

                      //email
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

                      //password
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

                      //Sign Up button
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(
                            75, 91, 91, 1.0),),
                        child:MaterialButton(
                          child: Text("Sign up"),
                          onPressed: ()async{
                            if (formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              signUp();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeLayout()),
                              );

                            }
                            ;
                          },
                        ),


                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      //have an account?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have an account?',
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                            child: Text('login',style: TextStyle(color:Color.fromRGBO(
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