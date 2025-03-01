import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/theme_mode.dart';
import 'package:quran_app/core/widget/custom_app_bar.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/last_read_widget.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_list_view.dart';
import 'package:quran_app/feature/Home/presentation/view_model/cubit/fetch_surah_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<FetchSurahCubit, FetchSurahState>(
              builder: (context, state) {
                if (state is FetchSurahSuccess) {
                  return CustomAppBar(
                    leftIcon: Icons.sort,
                    title: "Quran App",
                    rightIcon: CupertinoIcons.search,
                    rightIconOnTap: () {
                      context.push('/search_view', extra: state.surah);
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                "Asslamualaikum",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff8789A3),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Tanvir Ahassan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: themeProvider.isDarkTheme
                      ? Colors.white
                      : const Color(0xff240F4F),
                ),
              ),
            ),
            const LastReadWidget(),
            const SurahListView(),
          ],
        ),
      ),
    );
  }
}
