import 'package:flutter/material.dart';
import 'package:shoppixa/utils/custom_buttons/custom_back_button.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/text_utils.dart';

import '../model/categories_model.dart';

class MoreCategory extends StatelessWidget {
  const MoreCategory({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoriesModel> data = [
      CategoriesModel(
          name: "smartphones", id: 1, image: "", colorCode: "0xff4287f5"),
      CategoriesModel(
          name: "laptops", id: 1, image: "", colorCode: "0xff423a9c"),
      CategoriesModel(
          name: "fragrances", id: 1, image: "", colorCode: "0xff4a236b"),
      CategoriesModel(
          name: "skincare", id: 1, image: "", colorCode: "0xff0f4739"),
      CategoriesModel(
          name: "groceries", id: 1, image: "", colorCode: "0xff78321d"),
    ];

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 10.0,
          centerTitle: true,
          leading: const CustomBackButton()),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5),
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(
                    int.parse(data.elementAt(index).colorCode.toString())),
                borderRadius: BorderRadius.circular(11.0),
                image: DecorationImage(
                  image: NetworkImage(data.elementAt(index).image ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                  child: customText(
                      TextUtils()
                          .capitalizeFirst(data.elementAt(index).name ?? ""),
                      Colors.white,
                      16,
                      fontWeight: FontWeight.w500)),
            ),
          );
        },
      ),
    );
  }
}
