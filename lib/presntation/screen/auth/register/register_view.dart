import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/register_bloc/register_bloc.dart';
import 'package:releans_task/presntation/screen/auth/register/register_content.dart';
import 'package:releans_task/presntation/screen/home/home_view.dart';
import 'package:releans_task/repository/auth_repository/register_reopsitory.dart';

import '../../../../core/utils/show_toast.dart';
import '../../../bloc/auth_bloc/register_bloc/register_state.dart';
import '../login/login_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => RegisterRepo(),
        child: BlocProvider(
          create: (context) => RegisterBloc(context.read<RegisterRepo>()),
          child: BlocListener<RegisterBloc, RegisterState>(
              listener: (BuildContext context, state) {
                if (state is RegisterSuccessState) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) =>  HomeView()));
                  showToast(text: "Register Success", state: ToastState.SUCCESS);
                }
               else  if (state is RegisterErrorState) {
                  showToast(text: state.message , state: ToastState.ERROR);
                }
              },
              child: const RegisterContent()),
        ),
      ),
    );
  }
}
