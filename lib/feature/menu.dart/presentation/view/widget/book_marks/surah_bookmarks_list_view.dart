import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content_list_view.dart';
import 'package:quran_app/feature/Details/presentation/view_model/surah_bookmarks_cubit/surah_bookmarks_cubit.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/book_marks/warning_message.dart';

class SurahBookmarksListView extends StatelessWidget {
  const SurahBookmarksListView({super.key});

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
              title: "Ayah BookMarks",
              rightIcon: Icons.bookmark,
              leftIcon: Icons.arrow_back,
              leftIconOnTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<SurahBookmarksCubit, SurahBookmarksState>(
              builder: (context, state) {
                var cubit = SurahBookmarksCubit.get(context);
                return cubit.selectedBooKMarks.isEmpty
                    ? const WarningMessage()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.selectedBooKMarks.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => SurahContentListView(
                                    quran: cubit.selectedBooKMarks[index]));
                              },
                              child: SurahContent(
                                surah: cubit.selectedBooKMarks[index],
                                icon: Icon(
                                  Icons.bookmark_remove_rounded,
                                  color: secondColor,
                                ),
                                onPressed: () {
                                  cubit.delete(cubit.selectedBooKMarks[index]);
                                  showSnackBar(
                                    context,
                                    "Ayah removed from your Bookmarks",
                                    Icons.check_circle,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
