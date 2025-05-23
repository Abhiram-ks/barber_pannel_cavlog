part of 'fetch_booking_bloc.dart';

@immutable
abstract class FetchBookingEvent {}

class FetchBookingDatsRequest extends FetchBookingEvent {}

class FetchBookingDatasFilteringTransaction extends FetchBookingEvent {
  final String fillterText;

  FetchBookingDatasFilteringTransaction({required this.fillterText});
}

class FetchBookingDatasFilteringStatus extends FetchBookingEvent {
  final String status;

  FetchBookingDatasFilteringStatus({required this.status});
}

