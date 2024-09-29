import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/logout_bloc/logout_event.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../bloc/auth_bloc/logout_bloc/logout_bloc.dart';
import '../../../bloc/auth_bloc/logout_bloc/logout_state.dart';
import '../../../bloc/home_bloc/home_bloc.dart';
import '../../auth/login/login_view.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutBloc bloc = context.read<LogoutBloc>();
    return BlocListener<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if(state is LogoutSuccessState){
          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>LoginView()), (route) => false);
        }
      },
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.3,
        backgroundColor: const Color(0xFFB81448),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset('assets/images/user-profile.png')),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_repair_service_outlined,
                  color: Colors.white,
                )),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_bank_outlined,
                  color: Colors.white,
                )),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                )),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.show_chart,
                  color: Colors.white,
                )),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person_outlined,
                  color: Colors.white,
                )),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                )),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mail_lock_outlined,
                  color: Colors.white,
                )),
            const Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
            BlocBuilder<LogoutBloc, LogoutState>(
              builder: (context, state) {
                return state is LogoutLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : IconButton(
                        onPressed: () {
                          bloc.add(LogoutEventStartProcess());
                        },
                        icon: Row(
                          children: [
                            const Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const Icon(
                              Icons.logout,
                              color: Colors.white,
                            )
                          ],
                        ));
              },
            )
          ]),
        ),
      ),
    );
  }
}
