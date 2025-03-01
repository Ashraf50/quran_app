import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/routes/app_router.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view_model/azkar_bookmarks_cubit/azkar_book_marks_cubit.dart';
import 'package:quran_app/feature/Home/presentation/view_model/surah_bookmarks_cubit/surah_bookmarks_cubit.dart';
import 'package:quran_app/feature/Home/data/repo/home_repo_impl.dart';
import 'package:quran_app/feature/Home/presentation/view_model/cubit/fetch_surah_cubit.dart';
import 'package:quran_app/feature/prayer_time/data/repos/repo_impl.dart';
import 'package:quran_app/feature/prayer_time/presentation/view_model/cubit/get_all_pray_time_cubit.dart';
import 'package:quran_app/feature/search/data/search_cubit/search_cubit.dart';
import 'core/theme/theme_mode.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllPrayTimeCubit(PrayRepoImpl())..fetchAdanTime(),
        ),
        BlocProvider(
          create: (context) => AzkarBookMarksCubit(),
        ),
        BlocProvider(
          create: (context) => SurahBookmarksCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSurahCubit(HomeRepoImpl())..fetchSurah(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.router,
        theme: themeProvider.getThemeData,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
