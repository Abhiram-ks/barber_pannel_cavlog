part of 'fetch_comments_bloc.dart';

@immutable
abstract class FetchCommentsState {}

final class FetchCommentsInitial extends FetchCommentsState {}
final class FetchCommentsLoading extends FetchCommentsState {}
final class FetchCommentsEmpty extends FetchCommentsState {}
final class FetchCommentsSuccess extends FetchCommentsState {
  final List<CommentModel> comments;
  final String barberID;
  FetchCommentsSuccess({required this.comments,required this.barberID});
}
final class FetchCommentsFailure extends FetchCommentsState {}
