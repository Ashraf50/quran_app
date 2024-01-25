import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/text_style.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomAppBar(
              leftIcon: Icons.arrow_back,
              title: "Al-Fatiah",
              rightIcon: CupertinoIcons.search,
              rightIconOnTap: () {},
              leftIconOnTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Image.asset("assets/img/details background.png"),
                  const Positioned(
                    top: 70,
                    left: 110,
                    child: Column(
                      children: [
                        Text(
                          "Al-Fatiah",
                          style: Styles.textStyle26,
                        ),
                        Text(
                          "The opening",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text(
                              "MECCAN ",
                              style: Styles.textStyle14,
                            ),
                            Text(
                              "- 7 VERSES",
                              style: Styles.textStyle14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "بسم الله الرحمن الرحيم",
                          style: Styles.textStyle24,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
