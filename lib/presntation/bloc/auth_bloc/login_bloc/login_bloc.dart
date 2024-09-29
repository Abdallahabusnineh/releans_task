import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:releans_task/repository/auth_repository/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(this.loginRepository) : super(LoginInitialState()) {
  on<LoginEventStartProcess>(_onLoginStartLoginProcess);
  on<LoginShowPasswordEvent>(_onLoginShowPassword);
}
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  bool showPassword = false;
  LoginRepository loginRepository;
  UserInfo? userInfo;
  FutureOr<void> _onLoginStartLoginProcess(LoginEventStartProcess event, Emitter<LoginState> emit)async {
    emit(LoginLoadingState());
    try {
      await loginRepository.login(
          email: emailController.text,
          password: passwordController.text
      ).then((val){
        emit(LoginSuccessState());

      }).catchError((e){
        print('theeeeee ${e.toString()}');
        emit(LoginErrorState(message: e.toString()));
      });
    } on FirebaseException catch (e) {
      print(e.message);
      emit(LoginErrorState(message: e.message.toString()));
    } catch (e) {
      print(e.toString());
      emit(LoginErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _onLoginShowPassword(LoginShowPasswordEvent event, Emitter<LoginState> emit) {
    emit(LoginShowPasswordState());
    showPassword = !showPassword;
  }
}