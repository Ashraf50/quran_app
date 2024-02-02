import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/azkar_list_view.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

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
            title: "Azkar",
            rightIcon: Icons.search,
            leftIcon: Icons.sort,
            rightIconOnTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 165,
                child: Lottie.asset(
                  "assets/img/pray.json",
                  width: 180,
                ),
              ),
              const Column(
                children: [
                  Text(
                    "اسعد الله أوقاتكم",
                    style: Styles.textStyle20,
                  ),
                  Text(
                    "ربنا اغفر لنا ",
                    style: Styles.textStyle19,
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                "الأذكار",
                style: Styles.textStyle20,
              ),
            ),
          ),
          const AzkarListView(),
        ],
      ),
    ));
  }
}
