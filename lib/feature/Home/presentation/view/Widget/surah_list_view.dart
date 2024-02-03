import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/feature/Details/presentation/view/details_view.dart';
import 'package:quran_app/feature/Home/data/get_all_quran.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/loading.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_widget.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllQuran(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                mouseCursor: MaterialStateMouseCursor.clickable,
                onTap: () {
                  Get.to(() => DetailsView(
                        quran: snapshot.data![index],
                      ));
                },
                child: SurahWidget(quran: snapshot.data![index]),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return const Loading();
        }
      },
    );
  }
}
