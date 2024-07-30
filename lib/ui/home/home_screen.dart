import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goodlyfe/screens/gemini_screen.dart';
import 'package:goodlyfe/screens/ghq_screen.dart';
import 'package:goodlyfe/ui/auth/login_screen.dart';
import 'package:goodlyfe/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  
 

  String? userEmail;
  String? userName;
  double _currentSliderPrimaryValue = 0.2;
  final double _currentSliderSecondaryValue = 0.5;
  final auth = FirebaseAuth.instance;
  Future<String?> getCurrentUser() async{
    final User? user= auth.currentUser;
    return user?.email;
  }
  @override
  void initState(){
    super.initState();
    _loadCurrentUser();
  }
Future<void> _loadCurrentUser() async{
    userEmail = await getCurrentUser();
    userName = userEmail!.substring(0,(userEmail!.indexOf('@')));
    setState(() {
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(
            'Welcome\n$userName', style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 30,letterSpacing: 2)
        ),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value) {
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => const LoginScreen()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon: const Icon(Icons.logout_outlined),),
          const SizedBox(width: 20.0,)
        ],
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 100, 0, 0),
                        child: Text(
                          'How is your mood?', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 40)
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                        child: Text(
                          'On a scale of 1 - 3 how are you feeling today?', 
                          style: TextStyle(color: Color.fromARGB(255, 91, 91, 91),fontSize: 25)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 44, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/6637/6637186.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/6637/6637207.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/6637/6637168.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
                        child:  Slider(
                            activeColor: const Color.fromARGB(255, 45, 55, 197),
                            inactiveColor: Colors.grey,
                            value: _currentSliderPrimaryValue,
                            secondaryTrackValue: _currentSliderSecondaryValue,
                            label: _currentSliderPrimaryValue.round().toString(),
                            onChanged: (double value) {
                             setState(() {
                                 _currentSliderPrimaryValue = value;
                            });
                           },
                         ),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              //child: Text('Lets Get Going!', style: TextStyle(color: Color.fromARGB(255, 38, 51, 225),fontSize: 40))
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => const GhqScreen()) 
                      );
                    },
                     child: const Text('Lets Get Going!', style: TextStyle(color: Color.fromARGB(255, 45, 55, 197), fontSize: 40)))
                  ],
                )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => const GeminiHomeScreen()) 
                      );
                    },
        tooltip: 'Chat',
        child: const Icon(Icons.chat),
      ), 
    );
  }
}