import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onclick;
  final double? buttonWidth;
  final double? buttonHeight;

  const ButtonWidget({Key? key, 
    required this.text,
    required this.onclick,
    this.buttonWidth,
    this.buttonHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
  Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.grey.shade400),
          elevation: MaterialStateProperty.all(5.0)
        ),
        onPressed: onclick,
        child: Text(
          text,
          style: const TextStyle(
                          fontFamily: 'NotoSerif',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                          ),
          ),
        ),
    ),
  );
}
