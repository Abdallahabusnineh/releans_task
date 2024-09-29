abstract class LoginEvent {}

class LoginEventStartProcess extends LoginEvent {

  LoginEventStartProcess();
}
class LoginShowPasswordEvent extends LoginEvent {}