import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/Repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  NewsCubit(this.newsRepository) : super(NewsInitial());

  Future<void> News() async {
    emit(NewsLoading());
    try {
      final allnews = await newsRepository.getNews();
      print("News fetched: ${allnews.status}"); // Debug print
      if(allnews.status == 'OK'){
        emit(NewsSucess(allnews));
      } else {
        print("News fetching failed with status: ${allnews.status}");
        emit(NewsFailed());
      }
    } catch (e) {
      print("Exception caught: $e");
      emit(NewsFailed());
    }
  }

}
