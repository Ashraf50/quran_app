import 'package:flutter/material.dart';
import 'package:quran_app/core/constant/text_style.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String img;
  final Function()? onTap;
  const CustomListTile(
      {super.key, required this.title, required this.onTap, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            // color: Colors.white60,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(img),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: Styles.textStyle19,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
