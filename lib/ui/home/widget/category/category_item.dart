import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final void Function(String) onTapCategoryDetails;

  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.index,
    required this.onTapCategoryDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTapCategoryDetails(categoryModel.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven ? 25.r : 0),
            bottomRight: Radius.circular(index.isOdd ? 25.r : 0),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/${categoryModel.image}',
              height: 116.h,
              width: 132.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              categoryModel.title,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
