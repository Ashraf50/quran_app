import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/colors.dart';

showSnackBar(BuildContext context, String text, IconData icon) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // backgroundColor: Color.fromARGB(158, 0, 0, 0),
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          Icon(icon,color: secondColor,),
          const SizedBox(width: 10,),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      action: SnackBarAction(
        label: "Dismiss",
        onPressed: () {},
      ),
    ),
  );
}