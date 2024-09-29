import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/core/utils/show_toast.dart';
import 'package:releans_task/presntation/screen/auth/login/login_content.dart';
import 'package:releans_task/presntation/screen/home/home_view.dart';
import 'package:releans_task/repository/auth_repository/login_repository.dart';

import '../../../bloc/auth_bloc/login_bloc/login_bloc.dart';
import '../../../bloc/auth_bloc/login_bloc/login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => LoginRepository(),
        child: BlocProvider(
          create: (context) => LoginBloc(context.read<LoginRepository>()),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>  HomeView()));
                showToast(text: "Login Success", state: ToastState.SUCCESS);
              } else if (state is LoginErrorState) {
              showToast(text: state.message, state: ToastState.ERROR);
              }
            },
            child: const LoginContent(),
          ),
        ),
      ),
    );
  }
}
