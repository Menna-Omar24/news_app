import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/style/app_colors.dart';
import 'package:news_app/ui/category_details/news_list_widget.dart';

class CategoryDetailsWidget extends StatefulWidget {
  final String categoryId;

  const CategoryDetailsWidget({super.key, required this.categoryId});

  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('try again'),
              ),
            ],
          );
        }
        var response = snapshot.data;
        if (response?.status == 'error') {
          return Column(
            children: [
              Text(response?.message ?? ''),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('try again'),
              ),
            ],
          );
        }
        print(response?.sources?[0].id);
        return DefaultTabController(
          length: response?.sources?.length ?? 0,
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
                    tabs: response?.sources
                            ?.map(
                              (source) => Tab(
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
                                  child: Tab(
                                    child: Text(
                                      source.name ?? '',
                                      style: TextStyle(
                                        fontFamily: 'Exo',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList() ??
                        []),
                SizedBox(
                  height: 29.h,
                ),
                Expanded(
                  child: TabBarView(
                    children: response?.sources
                            ?.map(
                              (source) => NewsListWidget(
                                sourceId: source.id ?? "",
                              ),
                            )
                            .toList() ??
                        [],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
