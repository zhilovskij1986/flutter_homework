import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework/lesson_19/bloc/rate_app_state.dart';

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit() : super(RateAppState.initial());

  void selectRating(int newRating) {
    if (state.status == RateAppStatus.loading) return;

    emit(state.copyWith(rating: newRating));
  }

  void resetRating() {
    if (state.status == RateAppStatus.loading) return;

    emit(RateAppState.initial());
  }

  Future<void> submitRating() async {
    if (state.rating == 0 || state.status == RateAppStatus.loading) return;

    emit(state.copyWith(status: RateAppStatus.loading));

    await Future.delayed(const Duration(milliseconds: 1000));

    emit(state.copyWith(status: RateAppStatus.success));
  }

  void rateAgain() {
    emit(RateAppState.initial());
  }
}
