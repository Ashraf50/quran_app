import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/feature/AzkarPage/data/json_data.dart';
import 'package:quran_app/feature/AzkarPage/presentation/view/widget/custom_list_tile.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      title: snapshot.data![index].category!,
                      id: snapshot.data![index].id!,
                      onTap: () {
                        context.push('/azkar_view',
                            extra: snapshot.data![index]);
                      },
                    );
                  }),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 180),
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
