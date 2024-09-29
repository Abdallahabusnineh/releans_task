import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:releans_task/presntation/bloc/auth_bloc/logout_bloc/logout_bloc.dart';
import 'package:releans_task/presntation/bloc/home_bloc/home_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:releans_task/presntation/screen/auth/login/login_view.dart';
import 'package:releans_task/presntation/screen/home/home_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/utils/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomeBloc(),
                lazy: false,
              ),
              BlocProvider(
                create: (context) => LogoutBloc(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: FirebaseAuth.instance.currentUser!=null ? const HomeView():const LoginView(),
            ),
          );
      },
    );
  }
}
