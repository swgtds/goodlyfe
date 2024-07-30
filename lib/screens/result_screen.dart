
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goodlyfe/screens/chat_screen.dart';
import 'package:goodlyfe/screens/gemini_screen.dart';
import 'package:goodlyfe/screens/help_screen.dart';
import 'package:goodlyfe/ui/home/home_screen.dart';
import 'package:goodlyfe/widgets/next_button.dart';

class ResultScreen extends StatelessWidget {
     ResultScreen({
    super.key,
    required this.stress,
    required this.adp,
    required this.confidence,
    });
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final int stress;
    final int adp;
    final int confidence;
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  const Color.fromARGB(255, 140, 182, 250),
        body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(
                height: 100,
            ),
            const Text(
                'Your Results: ',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
            ),
            const SizedBox(
                height: 15,
            ),
            Row(
              children: [
                Stack(
                    alignment: Alignment.center,
                    children: [
                    stress==0 ?
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1,
                        color: Colors.red,
                        backgroundColor: Colors.white,
                        ),
                    )
                    : stress==18 ?
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1,
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ):
                     SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value:  1-(stress/18),
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ),
                    Column(
                        children: [
                         const Text(
                            //stress.toString() + "/12",
                            'Stress',
                            style: TextStyle(fontSize: 20, 
                                color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            '${stress==0?100:stress==18?0:(100-(stress/18)*100).abs().round()}%',
                            style: const TextStyle(fontSize: 30,color: Colors.black),
                        ),
                        
                        ],
                        
                    ),
                    ],
                ),
                const SizedBox(width: 50,),
                  //Text('Check postion'),
                  if (stress >= 0 && stress <=6)
                    const Text('Severe', style: TextStyle(fontSize: 30),)
                  else
                    if (stress>=7 && stress <= 12 )
                      const Text('Mild', style: TextStyle(fontSize: 30),)
                    else
                      const Text('Normal', style: TextStyle(fontSize: 30),)
              ],
            ),
            const SizedBox(
                height: 20,
            ),
             Row(
               children: [
                 Stack(
                    alignment: Alignment.center,
                    children: [
                    adp==0?
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1,
                        color: Colors.red,
                        backgroundColor: Colors.white,
                        ),
                    ): adp==12 ?
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 100,
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ):
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1-(adp / 12),
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ),
  
                    Column(
                        children: [
                          const Text(
                            //adp.toString() + "/12",
                            'Anxiety',
                            style: TextStyle(fontSize: 20, 
                                color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            '${adp==0?100:adp==12?0:(100-(adp/12)*100).abs().round()}%',
                            style: const TextStyle(fontSize: 30,color: Colors.black),
                        ),
                        
                        ],
                    ),
                    ],
                  ),
                  const SizedBox(width: 50,),
                  //Text('Check postion'),
                  if(adp >= 0 && adp <=4)
                    const Text('Severe', style: TextStyle(fontSize: 30),)
                  else
                    if (adp>=5 && adp <= 8 )
                      const Text('Mild', style: TextStyle(fontSize: 30),)
                    else
                      const Text('Normal', style: TextStyle(fontSize: 30),)
               ],
             ),
            const SizedBox(
                height: 20,
            ),
             Row(
               children: [
                 Stack(
                    alignment: Alignment.center,
                    children: [
                    adp==0?
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1,
                        color: Colors.red,
                        backgroundColor: Colors.white,
                        ),
                    ): adp==12?
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 100,
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ):
                     SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1-(adp / 12),
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ),
                    Column(
                        children: [
                          const Text(
                            //adp.toString() + "/12",
                            'Depression',
                            style: TextStyle(fontSize: 20, 
                                color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            '${adp==0?(100):adp==12?0:(100-(adp/12)*100).abs().round()}%',
                            style: const TextStyle(fontSize: 30,color: Colors.black),
                        ),
                        
                        ],
                    ),
                    ],
                  ),
                  const SizedBox(width: 50,),
                  //Text('Check postion'),
                  if(adp >= 0 && adp <=4)
                    const Text('Severe', style: TextStyle(fontSize: 30),)
                  else
                    if (adp>=5 && adp <= 8 )
                      const Text('Mild', style: TextStyle(fontSize: 30),)
                    else
                      const Text('Normal', style: TextStyle(fontSize: 30),)
               ],
             ),
            const SizedBox(
                height: 20,
            ),
             Row(
               children: [
                 Stack(
                    alignment: Alignment.center,
                    children: [
                      confidence==0?
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1,
                        color: Colors.red,
                        backgroundColor: Colors.white,
                        ),
                    ): confidence==6?
                    const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1,
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ):
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                        strokeWidth: 12,
                        value: 1-(confidence / 6),
                        color: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        ),
                    ),
                    Column(
                        children: [
                          const Text(
                            //confidence.toString() + "/12",
                            'Confidence',
                            style: TextStyle(fontSize: 20, 
                                color: Colors.black),
                        ),
                        
                        const SizedBox(height: 10),
                        Text(
                            '${confidence==0?(0): confidence==6 ?100:(100-(confidence/6)*100).abs().round()}%',
                            style: const TextStyle(fontSize: 30,color: Colors.black),
                        ),
                        ],
                        
                    ),
                    ],
                  ),
                  const SizedBox(width: 50,),
                  //Text('Check postion'),
                  if (confidence >= 0 && confidence <=2)
                    const Text('Severe', style: TextStyle(fontSize: 30),)
                  else if (confidence>=3 && confidence <= 4 )
                      const Text('Mild', style: TextStyle(fontSize: 30),)
                  else
                      const Text('Normal', style: TextStyle(fontSize: 30),)
               ],
             ),const SizedBox(
                height: 20,
            ),
            
            const SizedBox(
                height: 1,
            ),

            RectangularButton(
                onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                    ),
                );
                },
                label: 'Dashboard',
            ),
           const SizedBox(
                height: 1,
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // const Text("Dont have an account? "),
                    TextButton(onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => const HelpScreen(helpText: '',)//ChatPage(receiverUserEmail: receiverUserEmail, receiverUserID: receiverUserID)
                        
                        ) 
                      );
                    },
                     child: const Text('I Need Help!', style: TextStyle(fontSize:20,color:  Color.fromARGB(255, 45, 55, 197)
                     )
                     )
                     )
                  ],
                )
            ],
        ),
        ),
    );
    }
}