import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/core/theme/theme_mode.dart';
import 'package:quran_app/core/widget/conver_date.dart';
import 'package:quran_app/feature/prayer_time/presentation/view_model/cubit/get_all_pray_time_cubit.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    int day = DateTime.now().day;
    return Container(
      height: 540,
      decoration: BoxDecoration(
          color: themeProvider.isDarkTheme
              ? const Color(0xff121931)
              : const Color.fromARGB(122, 235, 234, 234),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      child: BlocBuilder<GetAllPrayTimeCubit, GetAllPrayTimeState>(
        builder: (context, state) {
          if (state is GetAllPrayTimeSuccess) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "مواقيت الصلاه ليوم ${state.time[day - 1].date!.hijri!.weekday!.ar!}",
                  style: Styles.textStyle19,
                ),
                const SizedBox(
                  height: 20,
                ),
                PrayWidget(
                  img: "assets/img/fajr.png",
                  title: "صلاه الفجر",
                  subTitle: state.time[day - 1].timings!.fajr!,
                ),
                PrayWidget(
                  img: "assets/img/duhr.png",
                  title: "صلاه الظهر",
                  subTitle: state.time[day - 1].timings!.dhuhr!,
                ),
                PrayWidget(
                  img: "assets/img/asr.png",
                  title: "صلاه العصر",
                  subTitle: state.time[day - 1].timings!.asr!,
                ),
                PrayWidget(
                  img: "assets/img/magrib.png",
                  title: "صلاه المغرب",
                  subTitle: state.time[day - 1].timings!.maghrib!,
                ),
                PrayWidget(
                  img: "assets/img/isha.png",
                  title: "صلاه العشاء",
                  subTitle: state.time[day - 1].timings!.isha!,
                ),
              ],
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

class PrayWidget extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  const PrayWidget({
    super.key,
    required this.img,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color:
              themeProvider.isDarkTheme ? AppColors.primaryColor : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Text(
                    title,
                    style: Styles.textStyle19,
                  ),
                  Text(
                    convertTo12HourFormat(subTitle),
                    style: Styles.textStyle16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              padding: const EdgeInsets.all(6),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: themeProvider.isDarkTheme
                    ? Colors.white
                    : const Color(0xffF4E8F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                img,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
