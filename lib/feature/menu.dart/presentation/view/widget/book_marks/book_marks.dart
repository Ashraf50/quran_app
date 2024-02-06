import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/book_marks/azkar_bookmarks_list_view.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/book_marks/surah_bookmarks_list_view.dart';

class BookMarksListView extends StatelessWidget {
  const BookMarksListView({super.key});

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
              title: "My BookMarks",
              rightIcon: Icons.bookmark,
              leftIcon: Icons.arrow_back,
              leftIconOnTap: () {
                Navigator.pop(context);
              },
            ),
            CustomWidget(
              title: "Ayah BookMarks",
              onTap: () {
                Get.to(
                  () => const SurahBookmarksListView(),
                );
              },
            ),
            CustomWidget(
              title: "Azkar BookMarks",
              onTap: () {
                Get.to(
                  () => const AzkarBookmarksListView(),
                );
              },
            ),
          ],
        ),
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
