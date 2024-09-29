import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/core/utils/regex_validation.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/register_bloc/register_bloc.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/register_bloc/register_event.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/register_bloc/register_state.dart';
import 'package:releans_task/presntation/screen/auth/login/login_view.dart';

import '../login/login_content.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterBloc bloc = context.read<RegisterBloc>();
    return Form(
      key: bloc.registerFormKey,
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
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      'Create New Account',
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
                                  duration: const Duration(milliseconds: 1300),
                                  child: TextFormField(
                                      controller: bloc.emailController,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          hintText: 'Email',
                                          prefixIcon: Icon(Icons.person),
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter email';
                                        } else {
                                          if (isValidEmail(
                                              email: value.toString())) {
                                            return null;
                                          } else {
                                            return 'Please enter valid email';
                                          }
                                        }
                                      }),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: FadeInLeft(
                                  duration: const Duration(milliseconds: 1600),
                                  child: TextFormField(
                                    controller: bloc.userName,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                        hintText: 'Name',
                                        prefixIcon: Icon(Icons.person),
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter username';
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200))),
                                child: FadeInLeft(
                                  duration: const Duration(milliseconds: 1900),
                                  child:
                                      BlocBuilder<RegisterBloc, RegisterState>(
                                    builder: (context, state) {
                                      return TextFormField(
                                          obscureText: bloc.showPassword,
                                          controller: bloc.passwordController,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                              hintText: 'Password',
                                              prefixIcon:
                                                  const Icon(Icons.security),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  bloc.add(
                                                      RegisterShowPasswordEvent());
                                                },
                                                icon: Icon(bloc.showPassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility),
                                              ),
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter password';
                                            } else if (validatePasswordRegex(
                                                password: value.toString())) {
                                              return null;
                                            } else {
                                              return 'password must at least 8 characters ';
                                            }
                                          });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.shade900,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.shade800,
                                    Colors.blue.shade700,
                                    Colors.blue.shade500
                                  ],
                                )),
                            child: Center(
                                child: FadeInLeft(
                              duration: const Duration(milliseconds: 2000),
                              child: BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  return state is RegisterLoadingState
                                      ? const CircularProgressIndicator()
                                      : TextButton(
                                          onPressed: () {
                                            if (bloc
                                                .registerFormKey.currentState!
                                                .validate()) {
                                              bloc.add(
                                                  RegisterEventStartProcess());
                                            }
                                          },
                                          child: const Text(
                                            'REGISTER NOW',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                },
                              ),
                            ))),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInLeft(
                            duration: const Duration(milliseconds: 2300),
                            child: const Text('Already have an account?')),
                        FadeInLeft(
                            duration: const Duration(milliseconds: 2500),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const LoginView();
                                  }));
                                },
                                child: const Text(
                                  'SIGN IN',
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
