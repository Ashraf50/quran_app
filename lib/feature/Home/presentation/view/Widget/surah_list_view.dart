import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran_app/feature/Details/presentation/view/details_view.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/loading.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_widget.dart';
import 'package:quran_app/feature/Home/presentation/view_model/cubit/get_all_quran_cubit.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllQuranCubit, GetAllQuranState>(
      builder: (context, state) {
        if (state is GetAllQuranSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.quran.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to( DetailsView(surah: state.quran[index],));
                },
                child: SurahWidget(surah: state.quran[index]),
              );
            },
          );
        } else if (state is GetAllQuranFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Loading();
        }
      },
    );
  }
}
