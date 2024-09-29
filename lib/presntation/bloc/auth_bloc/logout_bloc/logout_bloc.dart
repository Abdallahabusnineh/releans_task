import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {

  LogoutBloc() : super(LogoutInitialState()) {
    on<LogoutEventStartProcess>(_onLogoutEventStartProcess);
  }
  Future<void> _onLogoutEventStartProcess(LogoutEventStartProcess event, Emitter<LogoutState> emit) async {
    emit(LogoutLoadingState());
    try{
      await FirebaseAuth.instance.signOut().then((value) {
        emit(LogoutSuccessState());
        print('Logout Success');
      }).catchError((e) {
        emit(LogoutErrorState(error: e.toString()));
        print('Logout Error');
      });

    }catch(e){
      emit(LogoutErrorState(error: e.toString()));
    }
  }

}