import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content.dart';
import 'package:quran_app/feature/menu.dart/data/cubit/book_marks_cubit.dart';

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
              title: "BookMarks",
              rightIcon: Icons.bookmark,
              leftIcon: Icons.arrow_back,
              leftIconOnTap: () {
                Navigator.pop(context);
              },
              rightIconOnTap: () {},
            ),
            BlocBuilder<BookMarksCubit, BookMarksState>(
              builder: (context, state) {
                var cubit = BookMarksCubit();
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cubit.selectedBooKMarks.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SurahContent(
                      ayah: cubit.selectedBooKMarks[index],
                      icon: const Icon(Icons.bookmark_remove_rounded),
                      onPressed: () {
                        cubit.delete(cubit.selectedBooKMarks[index]);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
