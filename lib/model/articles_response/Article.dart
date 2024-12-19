import 'package:news_app/model/source_response/Source.dart';

/// source : {"id":"national-geographic","name":"National Geographic"}
/// author : "Tamsin Wressell"
/// title : "A calendar of New Year celebrations around the world"
/// description : "As many people gear up to celebrate the start of their New Year at the beginning of January, we take a look at how other cultures and countries mark the beginning of a new year."
/// url : "https://www.nationalgeographic.com/travel/article/calendar-new-year-celebrations-around-world"
/// urlToImage : "https://i.natgeofe.com/n/8868d550-b57e-47d1-8fba-bc1599eb7086/gettyimages-2_16x9.jpg?w=1200"
/// publishedAt : "2024-12-18T00:00:00Z"
/// content : "The marking of a New Year is an age-old tradition around the worldfood, fireworks and reflection with friends and family are common threads, but ultimately this varies between different calendars, re… [+6703 chars]"

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
