part of 'news_cubit.dart';

@immutable
abstract class NewsState {}
class NewsInitial extends NewsState {}
class NewsLoading extends NewsState {}
class NewsSucess extends NewsState {
  final News news_res;

  NewsSucess(this.news_res);
}
class NewsFailed extends NewsState {

}

