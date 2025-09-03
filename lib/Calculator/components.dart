import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String value;
  final VoidCallback onpress;
  final Color color;
  final Color color2;

  const RoundButton(
      {super.key,
      required this.value,
      required this.onpress,
      this.color = const Color.fromARGB(255, 214, 214, 214),
      this.color2 = Colors.black});

  @override
  build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 60,
            // width: 68,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)

                //  shape: BoxShape.circle

                ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                    color: color2, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
