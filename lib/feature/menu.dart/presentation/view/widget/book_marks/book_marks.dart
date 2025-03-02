import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';

class BookMarksListView extends StatelessWidget {
  const BookMarksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar(
            title: "My BookMarks",
          ),
          CustomWidget(
            title: "Ayah BookMarks",
            onTap: () {
              context.push('/surah_bookmarks');
            },
          ),
          CustomWidget(
            title: "Azkar BookMarks",
            onTap: () {
              context.push('/azkar_bookmarks');
            },
          ),
        ],
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const CustomWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Styles.textStyle19,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
