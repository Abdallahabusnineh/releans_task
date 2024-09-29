import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/core/utils/show_toast.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import 'package:releans_task/presntation/screen/auth/login/login_view.dart';

import '../../../bloc/auth_bloc/forget_password_bloc/forget_password_state.dart';
import 'forget_password_content.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetPasswordBloc(),
        child: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
            listener: (BuildContext context, state) {
              if (state is ForgetPasswordSuccessState) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginView()));
                showToast(text: "Check your email and reset your password", state: ToastState.SUCCESS);
              }
              if (state is ForgetPasswordErrorState) {
                showToast(text: state.message, state: ToastState.ERROR);
              }
            },
            child: const ForgetPasswordContent()),
      ),
    );
  }
}
