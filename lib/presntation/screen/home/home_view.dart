import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/presntation/screen/home/home_content.dart';
import 'package:releans_task/presntation/screen/home/widget/home_appbar.dart';
import 'package:releans_task/presntation/screen/home/widget/home_drawer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/show_toast.dart';
import '../../bloc/home_bloc/home_bloc.dart';
import '../../bloc/home_bloc/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer:  const HomeDrawer(),
          appBar:HomeAppbar.appBar(),
          body: BlocListener<HomeBloc, HomeState>(
              listener: (BuildContext context, state) {
                if(state is HomeSuccessState){
                  showToast(text: "message sent", state: ToastState.SUCCESS);
                }
                else if(state is HomeErrorState){
                  showToast(text: state.error, state: ToastState.ERROR);
                }

              },
              child: const HomeContent())),
    );
  }
}
