import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/style/app_colors.dart';
import 'package:news_app/ui/category_details/news_list_widget.dart';

class CategoryDetailsWidget extends StatelessWidget {
  final String categoryId;

  const CategoryDetailsWidget({super.key, required this.categoryId});

  static const List<String> sources = [
    'BBC',
    'CBC',
    'Sports',
    'BBC',
    'CBC',
    'Sports',
    'BBC',
    'CBC',
    'Sports',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sources.length,
      child: Padding(
        padding: REdgeInsets.all(15),
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              dividerHeight: 0,
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.lightPrimary,
                borderRadius: BorderRadius.circular(25.r),
              ),
              tabs: sources
                  .map(
                    (e) => Tab(
                  child: Container(
                    margin: REdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    padding: REdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: AppColors.lightPrimary,
                      ),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
            SizedBox(
              height: 29.h,
            ),
            Expanded(
              child: TabBarView(
                children: sources
                    .map(
                      (e) => const NewsListWidget(),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
