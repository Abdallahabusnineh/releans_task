abstract class RegisterState {}
class RegisterInitialState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterShowPasswordState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState {

  String message;
  RegisterErrorState({required this.message});
}