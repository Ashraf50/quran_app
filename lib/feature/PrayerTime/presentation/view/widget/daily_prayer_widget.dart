import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/constant/text_style.dart';
import 'package:quran_app/feature/PrayerTime/data/cubit/get_all_paray_time_cubit.dart';
import 'package:quran_app/feature/PrayerTime/presentation/view/widget/all_month_pray_time_view.dart';
import 'package:quran_app/feature/PrayerTime/presentation/view/widget/daily_widget/sub_title_widget.dart';
import 'package:quran_app/feature/PrayerTime/presentation/view/widget/daily_widget/title_widget.dart';

class DailyPrayerWidget extends StatelessWidget {
  const DailyPrayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int day = DateTime.now().day;
    return Center(
      child: BlocBuilder<GetAllPrayTimeCubit, GetAllPrayTimeState>(
        builder: (context, state) {
          if (state is GetAllPrayTimeSuccess) {
            return Container(
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    TitleWIdget(
                      pray: state.time[day - 1],
                    ),
                    SubTitleWidget(
                      pray: state.time[day - 1],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const AllMonthPrayTimeView(),
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xff1e9bd3),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "More",
                              style: Styles.textStyle19,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is GetAllPrayTimeFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
