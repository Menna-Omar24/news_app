import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/ui/category_details/article_item.dart';

class NewsListWidget extends StatelessWidget {
  static List<ArticleModel> articles = [
    ArticleModel(
      title: "Why are football's biggest clubs starting a new tournament?",
      image:
          "https://www.shutterstock.com/image-photo/create-visual-breaking-news-image-600nw-2528875197.jpg",
      date: DateTime.now(),
      source: 'bbc news',
    ),
    ArticleModel(
      title: "Why are football's biggest clubs starting a new tournament?",
      image:
      "https://www.shutterstock.com/image-photo/create-visual-breaking-news-image-600nw-2528875197.jpg",
      date: DateTime.now(),
      source: 'bbc news',
    ),
    ArticleModel(
      title: "Why are football's biggest clubs starting a new tournament?",
      image:
          "https://www.shutterstock.com/image-photo/create-visual-breaking-news-image-600nw-2528875197.jpg",
      date: DateTime.now(),
      source: 'bbc news',
    ),
    ArticleModel(
      title: "Why are football's biggest clubs starting a new tournament?",
      image:
          "https://www.shutterstock.com/image-photo/create-visual-breaking-news-image-600nw-2528875197.jpg",
      date: DateTime.now(),
      source: 'bbc news',
    ),
  ];

  const NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ArticleItem(
        articleModel: articles[index],
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: articles.length,
    );
  }
}
