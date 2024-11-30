import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/home/widget/category/category_item.dart';

class CategoriesTab extends StatelessWidget {
  final void Function(String) onTapCategoryDetails;
  const CategoriesTab({super.key,required this.onTapCategoryDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(
        horizontal: 37,
        vertical: 36,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '''Pick your category
of interest''',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 29.sp,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.1,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 25.w,
              ),
              itemBuilder: (context, index) => CategoryItem(
                onTapCategoryDetails: onTapCategoryDetails,
                categoryModel: CategoryModel.categories[index],
                index: index,
              ),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
