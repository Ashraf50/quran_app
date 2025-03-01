import 'package:flutter/material.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/text_style.dart';

class TextFieldSearch extends StatelessWidget {
  final TextEditingController searchController;
  final void Function(String)? onChanged;
  const TextFieldSearch({
    super.key,
    required this.searchController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Container(
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: secondColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            style: Styles.textStyle16,
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search for the surah",
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: secondColor,
              ),
              border: InputBorder.none,
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
