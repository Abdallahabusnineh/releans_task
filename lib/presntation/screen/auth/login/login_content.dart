import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/login_bloc/login_bloc.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/login_bloc/login_event.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/login_bloc/login_state.dart';
import 'package:releans_task/presntation/screen/auth/register/register_content.dart';
import 'package:releans_task/presntation/screen/auth/register/register_view.dart';

import '../../../../core/utils/regex_validation.dart';
import '../forget_password/forget_password_view.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = context.read<LoginBloc>();
    return Form(
      key: bloc.loginFormKey,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue.shade900,
          Colors.blue.shade800,
          Colors.blue.shade400,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInLeft(
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      'Welcome Back!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                const BoxShadow(
                                    color: Colors.blueGrey,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: FadeInLeft(
                                  duration: const Duration(milliseconds: 1500),
                                  child: TextFormField(
                                    controller: bloc.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                        hintText: 'Email',
                                        prefixIcon: Icon(Icons.person),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter email ';
                                      } else if (isValidEmail(
                                          email: value.toString())) {
                                        return null;
                                      } else {
                                        return 'Please enter valid email';
                                      }
                                    },
                                  ),
                                ),
                              ),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: FadeInLeft(
                                      duration: const Duration(milliseconds: 2000),
                                      child: TextFormField(
                                        obscureText: bloc.showPassword,
                                        controller: bloc.passwordController,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                            hintText: 'Password',
                                            prefixIcon: const Icon(Icons.security),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                bloc.add(
                                                    LoginShowPasswordEvent());
                                              },
                                              icon: Icon(bloc.showPassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                            ),
                                            hintStyle:
                                                const TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter password';
                                          } else if (validatePasswordRegex(
                                              password: value)) {
                                            return null;
                                          } else {
                                            return 'Password must be at least 8 characters';
                                          }
                                        },
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 2100),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordView()));
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return state is LoginLoadingState ? const CircularProgressIndicator() : Container(
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade800,
                                        Colors.blue.shade700,
                                        Colors.blue.shade500
                                      ],
                                    ),
                                    color: Colors.blue.shade900),
                                child: Center(
                                    child: FadeInLeft(
                                  duration: const Duration(milliseconds: 2300),
                                  child: TextButton(
                                    onPressed: () {
                                                    if(bloc.loginFormKey.currentState!.validate()){
                                                      bloc.add(LoginEventStartProcess());
                                                    }
                                    },
                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInLeft(
                            duration: const Duration(milliseconds: 2500),
                            child: const Text('Don\'t have an account?')),
                        FadeInLeft(
                            duration: const Duration(milliseconds: 2700),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterView()));
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
