import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_content.dart';
import 'package:quran_app/feature/Home/presentation/view_model/surah_bookmarks_cubit/surah_bookmarks_cubit.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/book_marks/warning_message.dart';

class SurahBookmarksListView extends StatelessWidget {
  const SurahBookmarksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomAppBar(
            title: "Ayah BookMarks",
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
                          return SurahContent(
                            ayah: cubit.selectedBooKMarks[index],
                            icon: Icon(
                              Icons.bookmark_remove_rounded,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              cubit.delete(cubit.selectedBooKMarks[index]);
                              showSnackBar(
                                context,
                                "Ayah removed from your Bookmarks",
                                Icons.check_circle,
                              );
                            },
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
