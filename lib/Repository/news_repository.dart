import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';

class NewsRepository{
  final dio = Dio();
  Future<News> getNews() async {
    final respones = await
    dio.get('https://api.nytimes.com/svc/topstories/v2/home.json?api-key=aQTqrDmZnHvRO7Wt4bjI1eQOhdrO3aHF');
    final news = News.fromJson(respones.data);
    return news;
  }
  void main() async
  {
    await getNews();
  }
}
