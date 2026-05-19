// ignore_for_file: public_member_api_docs, sort_constructors_first
enum RateAppStatus { initial, loading, success, error }

class RateAppState {
  final int rating;
  final RateAppStatus status;

  RateAppState({required this.rating, required this.status});

  factory RateAppState.initial() {
    return RateAppState(rating: 0, status: RateAppStatus.initial);
  }
  RateAppState copyWith({int? rating, RateAppStatus? status}) {
    return RateAppState(
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }
}
