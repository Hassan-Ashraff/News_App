import 'package:flutter/material.dart';
import 'package:news_app/Models/home_model.dart';
import 'package:news_app/Repository/home_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<News> sportNews;
  @override
  void initState() {
    super.initState();
    sportNews = getNews();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<News>(
          future: sportNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.results.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data!.results[index];
                    return ListTile(
                      trailing: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              item.multimedia[0].url ??
                                  'https://th.bing.com/th/id/OIP.GPKVlWlC6z0xDa-xzHcTVQHaFj?rs=1&pid=ImgDetMain',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        item.title ?? 'Not Found',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        item.createdDate.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
