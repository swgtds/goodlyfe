import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
    const RectangularButton({
    super.key,
    required this.onPressed,
    required this.label,
    });

    final VoidCallback? onPressed;
    final String label;

    @override
    Widget build(BuildContext context) {
    return
        TextButton(
        onPressed: onPressed,
        child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Card(
            color: onPressed != null ? const Color.fromARGB(255, 1, 211, 99) : const Color.fromARGB(255, 197, 50, 50),
            child: Center(
                child: Text(
                label,
                style: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
                ),
            ),
            ),
        ),
        );
    }
}