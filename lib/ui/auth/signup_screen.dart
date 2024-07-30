// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goodlyfe/ui/auth/login_screen.dart';
import 'package:goodlyfe/utils/utils.dart';
import 'package:goodlyfe/widgets/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void signUp(){
    setState(() {
                      loading = true;
                    });
                    _auth.createUserWithEmailAndPassword(
                     email: emailController.text.toString(),
                     password: passwordController.text.toString()).then((value){
                      setState(() {
                      loading = false;
                    });
                     }).onError((error, stackTrace){
                      Utils().toastMessage(error.toString());
                       setState(() {
                      loading = false;
                    });
                     });
                     final id = _auth.currentUser?.uid;
    final initial = {
      "email" : _auth.currentUser?.email ,
    };
    print(_auth.currentUser?.email);

    final db = FirebaseFirestore.instance ;
    db.collection("users").doc(id).set(initial).onError((error, stackTrace) => print("Error writing in database: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Your Email';
                  }
                  return null;
                },
              ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      keyboardType: TextInputType.text,
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                   prefixIcon: Icon(Icons.lock)
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Your Password';
                  }
                  return null;
                },
              ),
            ],
                  )
                  ),

              const SizedBox(height: 50,),
              RoundButton(
                title: 'Sign Up',
                loading: loading,
                onTap: (){
                  if(_formKey.currentState!.validate()){
                     signUp();
                  }
                }, onPressed: () {  }, label: '',
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  TextButton(onPressed: (){
                     Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen()) 
                    );
                  },
                   child: Text('Login', style: TextStyle(color: Color.fromARGB(255, 45, 55, 197))))

                ],
              )
            ],
            ),
        ),
    );
  }
}