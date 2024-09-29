abstract class ForgetPasswordState {}
class ForgetPasswordInitialState extends ForgetPasswordState {}
class ForgetPasswordLoadingState extends ForgetPasswordState {}
class ForgetPasswordSuccessState extends ForgetPasswordState {}
class ForgetPasswordErrorState extends ForgetPasswordState {
  String message;
  ForgetPasswordErrorState({required this.message});
}