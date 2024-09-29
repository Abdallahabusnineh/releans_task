import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/register_bloc/register_event.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/register_bloc/register_state.dart';
import 'package:releans_task/repository/auth_repository/register_reopsitory.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerRepo) : super(RegisterInitialState()) {
    on<RegisterEventStartProcess>(_onRegisterStartLoginProcess);
    on<RegisterShowPasswordEvent>(_onRegisterShowPassword);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userName = TextEditingController();
  final registerFormKey = GlobalKey<FormState>();
  bool showPassword = false;
  RegisterRepo registerRepo;

  FutureOr<void> _onRegisterStartLoginProcess(RegisterEventStartProcess event,
      Emitter<RegisterState> emit) async{
    emit(RegisterLoadingState());
    try {
      await registerRepo.register(
          email: emailController.text,
          password: passwordController.text,
          name: userName.text).then((val){
            emit(RegisterSuccessState());
          }).catchError((e){
            print('theeeeee ${e.toString()}');
            emit(RegisterErrorState(message: e.toString()));
          });

    } on FirebaseException catch (e) {
      print(e.message);
      emit(RegisterErrorState(message: e.message.toString()));
    } catch (e) {
      print(e.toString());
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  FutureOr<void> _onRegisterShowPassword(RegisterShowPasswordEvent event,
      Emitter<RegisterState> emit) {
    emit(RegisterShowPasswordState());
    showPassword = !showPassword;
  }
}