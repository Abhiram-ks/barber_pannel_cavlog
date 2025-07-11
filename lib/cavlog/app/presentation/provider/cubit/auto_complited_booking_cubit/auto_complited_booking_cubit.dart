import 'package:barber_pannel/cavlog/app/data/repositories/auto_comblite_booking_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auto_complited_booking_state.dart';

class AutoComplitedBookingCubit extends Cubit<AutoComplitedBookingState> {
 final CancelBookingRepository cancelBookingRepository;

  AutoComplitedBookingCubit(this.cancelBookingRepository) : super(AutoComplitedBookingInitial());

    Future<void> completeBooking(String docId) async {

    final success = await cancelBookingRepository.updateBookingStatus(
      refund: 0.0,
      docId: docId,
      serviceStatus: 'Completed',
      transactionStatus: 'Debited',
    );

    if (success) {
      emit(AutoComplitedBookingSuccess());
    } else {
      emit(AutoComplitedBookingFailure());
    }
  }
}
