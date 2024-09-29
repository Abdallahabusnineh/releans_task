import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEventStartProcess>(_onHomeEventStartProcess);
  }
  final TextEditingController senderController = TextEditingController();
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
GlobalKey<FormState> homeFormKey = GlobalKey<FormState>();
  Future<void> _onHomeEventStartProcess(HomeEventStartProcess event, Emitter<HomeState> emit) async {
emit(HomeLoadingState());
    try{
  await FirebaseFirestore.instance.collection("messages").add({
    "sender": senderController.text,
    "receiver": receiverController.text,
    "message": messageController.text
  }).then((value) {
    emit(HomeSuccessState());
    senderController.clear();
    receiverController.clear();
    messageController.clear();
  }).catchError((e) {
    print('abd  ${e.toString()}');
    emit(HomeErrorState(error: e.toString()));
  });

}catch(e){
  print(e);
  emit(HomeErrorState(error: e.toString()));
}
  }
}