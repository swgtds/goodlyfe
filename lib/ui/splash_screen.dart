import 'package:flutter/material.dart';
import 'package:goodlyfe/firebase_services/splash_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    //final urlImage = "https://images.unsplash.com/photo-1588420343618-6141b3784bce?q=80&w=2012&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return  Scaffold(
      body: Container(
      decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/gradient.png'),
                fit: BoxFit.cover),
          ),
        child: const Center(
        child: Text('GoodLyfe', style: TextStyle(fontSize: 40, fontFamily: 'MoonDance', fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:goodlyfe/firebase_services/splash_services.dart';
//import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   SplashServices splashScreen = SplashServices();
  @override
  void initState() {
   super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           /* Center(
              child:
               Lottie.asset(
                'asset/animation/splash-screen-animation.json', // Replace with the path to your Lottie JSON file
                fit: BoxFit.cover,
                width: 400, // Adjust the width and height as needed
                height: 400,
                repeat: true, // Set to true if you want the animation to loop
              ),
            ),*/
            Center(
              child: Text(
                "Splash Screen",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}*/