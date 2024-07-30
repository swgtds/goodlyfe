// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton({super.key, 
  required this.title,
  required this.onTap,
  this.loading = false, required Null Function() onPressed, required String label
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 45, 55, 197),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3.0,color: Colors.white,) :
      Text(title, style: const TextStyle(color: Colors.white),),),
      ),
    );
  }
}