import 'package:flutter/material.dart';

class GeneralDialog extends StatelessWidget {
  const GeneralDialog({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.desc,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final String desc;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 200,
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w800, color: titleColor),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  child: Text(
                    "OK",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: onPressed),
            )
          ],
        ),
      ),
    );
  }
}
