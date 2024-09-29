import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/forget_password_bloc/forget_password_event.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/forget_password_bloc/forget_password_state.dart';
import '../../../../core/utils/regex_validation.dart';
import '../../../bloc/auth_bloc/forget_password_bloc/forget_password_bloc.dart';
import '../register/register_view.dart';

class ForgetPasswordContent extends StatelessWidget {
  const ForgetPasswordContent({super.key});
  @override
  Widget build(BuildContext context) {
    ForgetPasswordBloc bloc = context.read<ForgetPasswordBloc>();
    return Form(
      key: bloc.forgotPasswordFormKey,
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
                        'Forget Password',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      'Enter your email and we will send \nyou a link to reset your password',
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,),
                        Image.asset('assets/images/reset_password.gif'),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.blueGrey,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade200))),
                            child: FadeInLeft(
                              duration: const Duration(milliseconds: 1300),
                              child: TextFormField(
                                controller: bloc.emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    hintText: 'Email',
                                    prefixIcon: Icon(Icons.email),
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
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,),
                        BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
                          builder: (context, state) {
                            return state is ForgetPasswordLoadingState ? const CircularProgressIndicator() : Container(
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
                                      duration: const Duration(milliseconds: 1700),
                                      child: TextButton(
                                        onPressed: () {
                                          if(bloc.forgotPasswordFormKey.currentState!.validate()){
                                            bloc.add(ForgetPasswordStartProcessEvent());
                                          }
                                        },
                                        child: const Text(
                                          'Submit',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )));
                          },
                        ),

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
