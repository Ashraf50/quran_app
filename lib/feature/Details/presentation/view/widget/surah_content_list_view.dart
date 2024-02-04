import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/constant/colors.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';
import 'package:quran_app/feature/Details/presentation/view/widget/surah_content.dart';
import 'package:quran_app/feature/menu.dart/data/cubit/book_marks_cubit.dart';

class SurahContentListView extends StatelessWidget {
  final QuranModel quran;
  const SurahContentListView({
    super.key,
    required this.quran,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarksCubit, BookMarksState>(
      builder: (context, state) {
        // var cubit = BookMarksCubit.get(context);
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quran.array!.length,
              itemBuilder: (context, index) {
                return SurahContent(
                  surahText: quran.array![index].ar!,
                  path: quran.array![index].path!,
                  id: quran.array![index].id!,
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border,
                    color: secondColor,
                  ),
                  //   if (cubit.isSelected(quran.array![index] as QuranModel)) {
                  //     cubit.delete(quran.array![index] as QuranModel);
                  //     showSnackBar(
                  //       context,
                  //       "Ayah removed from your Bookmarks",
                  //       Icons.check_circle,
                  //     );
                  //   } else {
                  //     cubit.add(quran.array![index] as QuranModel);
                  //     showSnackBar(
                  //       context,
                  //       "Ayah added to your Bookmarks",
                  //       Icons.bookmark,
                  //     );
                  //   }
                  // },
                  // icon: Icon(
                  // //   cubit.isSelected(quran.array![index] as QuranModel)
                  //       Icons.bookmark
                  //       : Icons.bookmark_border,
                  //   color: secondColor,
                  // ),
                );
              },
            ));
      },
    );
  }
}
