import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/style/app_colors.dart';

typedef SelectTab = void Function(TabEnum);

class CustomDrawer extends StatelessWidget {
  final SelectTab onPress;

  const CustomDrawer({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(
            vertical: 43,
          ),
          color: AppColors.lightPrimary,
          child: Text(
            "News App!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: 29.h,
        ),
        InkWell(
          onTap: () {
            onPress(TabEnum.categories);
          },
          child: Padding(
            padding: REdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 11.sp,
                ),
                Text(
                  "Categories",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 23.sp,
        ),
        InkWell(
          onTap: () {
            onPress(TabEnum.settings);
          },
          child: Padding(
            padding: REdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 11.sp,
                ),
                Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum TabEnum {
  categories,
  settings,
}
