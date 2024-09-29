import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:releans_task/core/utils/show_toast.dart';
import '../../model/user_info_model.dart';

class RegisterRepo {
  Future<UserInfoModel> register({required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await registerUserInfo(
        email: email,
        name: name,
        user:credential.user!,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  Future<UserInfoModel> registerUserInfo(
      {required String email,
        required User user,
        required String name,

      }) async {
    try {
      var users =
      await FirebaseFirestore.instance.collection("users").add({
        'name': name, // John Doe
        'email': email, // Stokes and Sons
        'uid': user.uid,
      }).then((value){
        print('hte dddd ${value.firestore}');
      });


      print('$users ============= user');

      return UserInfoModel.fromJson({
        'name': name, // John Doe
        'email': email, // Stokes and Sons
        'uid': user.uid,
      },);
    } on FirebaseException catch (e) {
      print('hte eeeeee ${e.message}');
      throw Exception(e.message);
    }
  }
}