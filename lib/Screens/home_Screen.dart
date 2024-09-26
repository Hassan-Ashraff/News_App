import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Cubit/news_cubit/news_cubit.dart';
import 'package:news_app/Repository/news_repository.dart';
import 'package:news_app/Screens/newsDetails_Screen.dart';
import 'package:skeletonizer/skeletonizer.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News',
          style: TextStyle(fontWeight: FontWeight.w700,
              fontFamily: 'IBMPlexSans-Bold'
         ),),
      ),
      body:
      BlocProvider(
        create: (context)=>NewsCubit(NewsRepository())..News(),
        child:BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return  Skeletonizer(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: Container(
                        width: widthScreen*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://th.bing.com/th/id/OIP.GPKVlWlC6z0xDa-xzHcTVQHaFj?rs=1&pid=ImgDetMain'),
                          ),
                        ),
                      ),
                      title: Text(
                       'Demo Title',
                        style:  TextStyle(fontFamily: 'IBMPlexSans-Bold',color: Colors.black, fontWeight: FontWeight.w700,fontSize: widthScreen*0.04),
                      ),
                      subtitle: Text(
                        'Demo TitleDemo TitleDemo TitleDemo TitleDemo TitleDemo Title',
                        style:  TextStyle(fontFamily: 'IBMPlexSans-Regular',color: Colors.grey,fontSize: widthScreen*0.035),
                      ),
                    );
                  },
                ),
              );
            } else if (state is NewsFailed) {
              return const Center(child: Text('Error'));
            } else if (state is NewsSucess) {


               return

              ListView.builder(
                itemCount: state.news_res.results.length,
                itemBuilder: (context, index) {
                  final details_item = state.news_res;
                  final item = state.news_res.results[index];
                  final multimediaList = item.multimedia;
                  final imageUrl = multimediaList.isNotEmpty && multimediaList[0].url != null
                      ? multimediaList[0].url!
                      : 'https://th.bing.com/th/id/OIP.GPKVlWlC6z0xDa-xzHcTVQHaFj?rs=1&pid=ImgDetMain';

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsdetailsScreen(itemOfResult: item,detailsItem: details_item,),
                        ),
                      );
                    },
                    child: ListTile(
                      trailing: Container(
                        width: widthScreen*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imageUrl),
                          ),
                        ),
                      ),
                      title: Text(
                        item.title ?? 'Not Found',
                        style:  TextStyle(fontFamily: 'IBMPlexSans-Bold',color: Colors.black, fontWeight: FontWeight.w700,fontSize: widthScreen*0.04),
                      ),
                      subtitle: Text(
                        item.createdDate.toString(),
                        style:  TextStyle(fontFamily: 'IBMPlexSans-Regular',color: Colors.grey,fontSize: widthScreen*0.035),
                      ),
                    ),
                  );
                },
              );

            } else {
              return const Center(child: Text('Unexpected Error'));
            }
          },
        )
      )
    );
  }
}
