import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/main.dart';
import 'package:releans_task/presntation/bloc/home_bloc/home_bloc.dart';
import 'package:releans_task/presntation/bloc/home_bloc/home_event.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../bloc/home_bloc/home_state.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = context.read<HomeBloc>();
    return Form(
      key: bloc.homeFormKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_iphone_outlined,
                      color: Colors.blue,
                      size: 27.sp,
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Send SMS',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Send On-time SMS up to multiple recipients',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              FadeInRight(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  'FROM',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
                ),
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 1200),
                child: TextFormField(
                    controller: bloc.senderController,
                    decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle:
                            TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                   ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required field';
                  }
                },
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 1400),
                child: Text(
                  'TO',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
                ),
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 1600),
                child: TextFormField(
                    controller: bloc.receiverController,
                    decoration: InputDecoration(
                      hintText: 'Ex. +44123456789',
                      hintStyle:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required field';
                  }
                },
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 1800),
                child: Text(
                  'Message Text',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
                ),
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 2000),
                child: TextFormField(
                    controller: bloc.messageController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Required field';
                  }
                },
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (BuildContext context, state) {
                    return state is HomeLoadingState? const Center(child: CircularProgressIndicator()) : Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                         if (bloc.homeFormKey.currentState!.validate()) {
                           bloc.add(HomeEventStartProcess());
                         }
                        },
                        icon: Container(
                          width: 100,
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC107),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.send,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'Send',
                                style: TextStyle(fontSize: 18.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
