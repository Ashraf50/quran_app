import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/constant/theme_mode.dart';
import 'package:quran_app/core/repos/repo_impl.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view_model/azkar_bookmarks_cubit/azkar_book_marks_cubit.dart';
import 'package:quran_app/feature/Details/presentation/view_model/surah_bookmarks_cubit/surah_bookmarks_cubit.dart';
import 'package:quran_app/feature/prayer_time/data/cubit/get_all_paray_time_cubit.dart';
import 'package:quran_app/feature/search/data/search_cubit/search_cubit.dart';
import 'package:quran_app/feature/splash/presentation/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool storedValue = pref.getBool('boolValue') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkTheme: storedValue),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllPrayTimeCubit(HomeRepoImpl(ApiServices(Dio())))
                ..fetchAdanTime(),
        ),
        BlocProvider(
          create: (context) => AzkarBookMarksCubit(),
        ),
        BlocProvider(
          create: (context) => SurahBookmarksCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        )
      ],
      child: GetMaterialApp(
        theme: themeProvider.getThemeData,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
