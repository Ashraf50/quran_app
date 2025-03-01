import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/text_style.dart';
import 'package:quran_app/core/theme/theme_mode.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final int id;
  final Function()? onTap;
  const CustomListTile(
      {super.key, required this.title, required this.onTap, required this.id});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              scale: 1.0,
                              opacity: 40,
                              image: AssetImage(
                                "assets/img/muslim.png",
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            id.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: themeProvider.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        title,
                        style: Styles.textStyle19,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  color: Color.fromARGB(135, 187, 196, 206),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
