import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/core/utils/text_style.dart';

class LastReadWidget extends StatelessWidget {
  const LastReadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/img/home_background.png"),
        const Positioned(
          left: 50,
          top: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.bookOpen,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Last Read",
                    style: Styles.textStyle14,
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Al-Fatiah",
                style: Styles.textStyle18,
              ),

              Text(
                "Ayah No: 1",
                style: Styles.textStyle14,
              )
            ],
          ),
        )
      ],
    );
  }
}
