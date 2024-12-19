// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/articles_response/Article.dart';
import '../../style/app_colors.dart';

class ArticleItem extends StatelessWidget {
  final Article articleModel;

  const ArticleItem({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CachedNetworkImage(
        //   imageUrl: articleModel.urlToImage,
        //   fit: BoxFit.cover,
        //   height: 232.h,
        //   width: double.infinity,
        //   placeholder: (context, url) => const Center(
        //     child: CircularProgressIndicator(),
        //   ),
        //   errorWidget: (context, url, error) =>  Icon(
        //     Icons.error,
        //     size: 40.sp,
        //     color: AppColors.lightPrimary,
        //   ),
        // ),
        Image.network(
          articleModel.urlToImage ?? '',
          fit: BoxFit.cover,
          height: 232.h,
          width: double.infinity,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          articleModel.source?.name ?? '',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          articleModel.title ?? '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            timeago.format(
              DateTime.parse(articleModel.publishedAt ?? ''),
            ),
          ),
        ),
      ],
    );
  }
}
