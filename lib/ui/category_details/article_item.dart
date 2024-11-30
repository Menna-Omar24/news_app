import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/style/app_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  final ArticleModel articleModel;

  const ArticleItem({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: articleModel.image,
          fit: BoxFit.cover,
          height: 232.h,
          width: double.infinity,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) =>  Icon(
            Icons.error,
            size: 12.sp,
            color: AppColors.lightPrimary,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          articleModel.source,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          articleModel.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            timeago.format(articleModel.date),
          ),
        ),
      ],
    );
  }
}
