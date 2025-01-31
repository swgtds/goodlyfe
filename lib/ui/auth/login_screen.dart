import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodlyfe/ui/auth/signup_screen.dart';
import 'package:goodlyfe/ui/home/home_screen.dart';
import 'package:goodlyfe/utils/utils.dart';
import 'package:goodlyfe/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void login(){
    setState(() {
      loading = true;
    });

    _auth.signInWithEmailAndPassword(
     email: emailController.text,
     password: passwordController.text.toString()).then((value){
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context,
       MaterialPageRoute(builder: (context) => const HomeScreen())
      );
      setState(() {
      loading = false;
    });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
      loading = false;
    });
    });
  }
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop(); 
        return true;
       },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Login'),
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
                  title: 'Login',
                  loading: loading,
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      login();
                    }
                  }, onPressed: (){}, label: '`', 
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have an account? "),
                    TextButton(onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen()) 
                      );
                    },
                     child: const Text('Sign Up', style: TextStyle(color: Color.fromARGB(255, 45, 55, 197))))
      
                  ],
                )
              ],
              ),
          ),
      ),
    );
  }
}