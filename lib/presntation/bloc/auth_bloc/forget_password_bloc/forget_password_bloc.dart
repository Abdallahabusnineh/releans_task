import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show_toast.dart';
import 'forget_password_event.dart';
import 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState>{
  ForgetPasswordBloc() : super(ForgetPasswordInitialState()) {
    on<ForgetPasswordStartProcessEvent>(_onForgetPasswordStartProcess);
  }
  final emailController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  FutureOr<void> _onForgetPasswordStartProcess(event, Emitter<ForgetPasswordState> emit)async {
    emit(ForgetPasswordLoadingState());
    try {
      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: emailController.text.trim())
          .get();
      if (userSnapshot.docs.isEmpty) {
        showToast(text: 'Email not found', state: ToastState.ERROR);
        emit(ForgetPasswordErrorState(message: 'Email not found'));
      } else {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim())
            .then((value) {
          debugPrint('The email send successfully');
          emit(ForgetPasswordSuccessState());
        }).catchError((e) {
          debugPrint('Error in _onForgetPasswordStartProcess ::: ${e.toString()}');
          emit(ForgetPasswordErrorState(message: e));
        });
      }
    } catch (e) {
      emit(ForgetPasswordErrorState(message: e.toString()));
    }
    }
  }
