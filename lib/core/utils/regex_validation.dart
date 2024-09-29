/*
bool validateEmailRegex({required String email}) {
  return RegExp(
    //email format validation
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

*/



bool isValidEmail({required String email}) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}
/*
bool validatePasswordRegex({required String password}) {
  return RegExp(
  this password must have at least 6 characters and must contain at least one uppercase letter, one lowercase letter, one number, and one special character.
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
      .hasMatch(password);
}*/
/*bool validatePasswordRegex({required String password}) {
  return RegExp(
      //this password must have at least 6 characters and must contain at least one uppercase letter, one lowercase letter, one number, and one special character.
      r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(password);
}*/
bool validatePasswordRegex({required String password}) {
  return RegExp(
      //this password must have at least 8 digits this is same flutter firebase .
      r'\d{8,}')
      .hasMatch(password);
}
