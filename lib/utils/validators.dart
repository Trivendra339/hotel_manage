class Validators {
  static String? validateEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if(email.isEmpty){
      return 'Email can\'t be empty';
    }else if(!emailRegExp.hasMatch(email)){
      return 'Enter a correct email';
    }
    return null;
  }

  static String? validatePassword(String password){
    if(password.isEmpty){
      return 'password can\'t be empty';
    }else if(password.length < 6){
      return 'password must be at least 6 characters long';
    }
    return null;
  }

}