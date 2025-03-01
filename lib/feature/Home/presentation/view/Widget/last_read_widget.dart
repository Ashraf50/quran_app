import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran_app/core/theme/text_style.dart';

class LastReadWidget extends StatefulWidget {
  const LastReadWidget({super.key});

  @override
  LastReadWidgetState createState() => LastReadWidgetState();
}

class LastReadWidgetState extends State<LastReadWidget> {
  String lastSurah = "";

  @override
  void initState() {
    super.initState();
    _loadLastRead();
  }

  Future<void> _loadLastRead() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      lastSurah = pref.getString('lastSurah') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset("assets/img/home_background.png"),
          Positioned(
            left: 50,
            top: 30,
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.bookOpen,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Last Read",
                        style: Styles.textStyle14,
                      )
                    ],
                  ),
                  Text(
                    lastSurah,
                    style: Styles.textStyle18,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
