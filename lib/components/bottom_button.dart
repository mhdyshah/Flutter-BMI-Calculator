import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.buttonTitle, required this.onTap})
      : super(key: key);

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        color: const Color.fromARGB(255, 179, 18, 66),
        width: double.infinity,
        height: 50.0,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: "Ramaraja", fontSize: 25.0),
        ),
      ),
    );
  }
}
