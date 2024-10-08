abstract class HomeState {}

class HomeInitialState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeSuccessState extends HomeState {}
class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState({required this.error});
}