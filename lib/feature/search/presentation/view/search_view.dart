import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/widget/custom_scaffold.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/quran_model.dart';
import 'package:quran_app/feature/Home/presentation/view/Widget/surah_widget.dart';
import 'package:quran_app/feature/search/data/search_cubit/search_cubit.dart';
import 'package:quran_app/feature/search/presentation/view/widget/search_text_field.dart';

class SearchView extends StatefulWidget {
  final List<QuranModel> quran;
  const SearchView({
    super.key,
    required this.quran,
  });

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final searchController = TextEditingController();
  List<QuranModel> filteredSurah = [];

  @override
  void initState() {
    super.initState();
    filteredSurah = widget.quran;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, List<QuranModel>>(
      listener: (context, state) {},
      builder: (context, search) {
        return CustomScaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              TextFieldSearch(
                  searchController: searchController,
                  onChanged: (value) {
                    return searchSurahAr(value);
                  }),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredSurah.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.push('/details_view',
                            extra: filteredSurah[index]);
                      },
                      child: SurahWidget(
                        quran: filteredSurah[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void searchSurahAr(String query) {
    setState(() {
      filteredSurah = widget.quran
          .where((surah) =>
              (surah.name!.toLowerCase().contains(query)) ||
              (surah.nameTranslation!.toLowerCase().contains(query)))
          .toList();
    });
  }
}
