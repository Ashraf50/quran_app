import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/azkar_widget.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view_model/azkar_bookmarks_cubit/azkar_book_marks_cubit.dart';
import 'package:quran_app/feature/menu.dart/presentation/view/widget/book_marks/warning_message.dart';

class AzkarBookmarksListView extends StatelessWidget {
  const AzkarBookmarksListView({super.key});

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
              title: "Azkar BookMarks",
              rightIcon: Icons.bookmark,
              leftIcon: Icons.arrow_back,
              leftIconOnTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<AzkarBookMarksCubit, AzkarBookMarksState>(
              builder: (context, state) {
                var cubit = AzkarBookMarksCubit.get(context);
                return cubit.selectedBooKMarks.isEmpty
                    ? const WarningMessage()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.selectedBooKMarks.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AzkarWidget(
                              azkar: cubit.selectedBooKMarks[index],
                              icon: Icon(
                                Icons.bookmark_remove_rounded,
                                color: secondColor,
                              ),
                              onPressed: () {
                                cubit.delete(cubit.selectedBooKMarks[index]);
                                showSnackBar(
                                  context,
                                  "Removed from your Bookmarks",
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
      ),
    );
  }
}
