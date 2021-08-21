import 'package:flutter/material.dart';
import 'package:work/models/hot_category_job_model.dart';
import 'package:work/pages/category_page.dart';

import '../theme.dart';

class CategoryCard extends StatelessWidget {
  final HotCategoryJobModel categoryJobModel;

  CategoryCard({
    required this.categoryJobModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryJobModel: categoryJobModel,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(right: defaultMargin),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              categoryJobModel.imageUrl!,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            categoryJobModel.name!,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
        ),
      ),
    );
  }
}
