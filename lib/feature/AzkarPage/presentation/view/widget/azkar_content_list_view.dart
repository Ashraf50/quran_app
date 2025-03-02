import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/AzkarPage/data/model/azkar_model/azkar_model.dart';
import 'package:quran_app/core/widget/show_snack_bar.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/azkar_widget.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view_model/azkar_bookmarks_cubit/azkar_book_marks_cubit.dart';

class AzkarContentListView extends StatelessWidget {
  final AzkarModel azkar;
  const AzkarContentListView({super.key, required this.azkar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: BlocBuilder<AzkarBookMarksCubit, AzkarBookMarksState>(
        builder: (context, state) {
          var cubit = AzkarBookMarksCubit.get(context);
          return ListView.builder(
              shrinkWrap: true,
              itemCount: azkar.array!.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AzkarWidget(
                  azkar: azkar.array![index],
                  icon: Icon(
                    cubit.isSelected(azkar.array![index])
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                  ),
                  onPressed: () {
                    if (cubit.isSelected(azkar.array![index])) {
                      cubit.delete(azkar.array![index]);
                      showSnackBar(
                        context,
                        "Removed from your Bookmarks",
                        Icons.check_circle,
                      );
                    } else {
                      cubit.add(azkar.array![index]);
                      showSnackBar(
                        context,
                        "Added to your Bookmarks",
                        Icons.bookmark,
                      );
                    }
                  },
                );
              });
        },
      ),
    );
  }
}
