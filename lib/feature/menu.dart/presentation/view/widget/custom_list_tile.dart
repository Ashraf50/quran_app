import 'package:flutter/material.dart';
import 'package:quran_app/core/color/colors.dart';

class CustomListTile extends StatelessWidget {
  final IconData? leftIcon;
  final IconData? rightIcon;
  final String title;
  final Color? textColor;

  const CustomListTile({
    super.key,
    required this.leftIcon,
    required this.rightIcon,
    required this.title,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  leftIcon,
                  color: secondColor,
                  size: 23,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(rightIcon),
          )
        ],
      ),
    );
  }
}
