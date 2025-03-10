import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/feature/Home/data/save_last_read.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/loading.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_widget.dart';
import 'package:quran_app/feature/Home/presentation/view_model/cubit/fetch_surah_cubit.dart';

class PlayerListView extends StatelessWidget {
  const PlayerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSurahCubit, FetchSurahState>(
      builder: (context, state) {
        if (state is FetchSurahLoading) {
          return Loading();
        } else if (state is FetchSurahSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.surah.length,
            itemBuilder: (context, index) {
              return InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  context.push(
                    '/player_details',
                    extra: {
                      'surahNum':
                          state.surah[index].id.toString().padLeft(3, '0'),
                      'surahName': state.surah[index].name,
                    },
                  );
                  saveLastRead(surah: state.surah[index].nameTranslation!);
                },
                child: SurahWidget(quran: state.surah[index]),
              );
            },
          );
        } else if (state is FetchSurahFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Styles.textStyle18,
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
