class Validator {
  Validator._();

  static String? email(String? email) {
    if (email == null || email.isEmpty) {
      return 'The field must not be empty';
    }

    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!regex.hasMatch(email)) {
      return 'You entered the wrong email format';
    }

    return null;
  }

  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return 'The field must not be empty';
    }

    if (password.length < 8) {
      return 'The password must contain at least 8 characters';
    }

    RegExp regexUpperCase = RegExp(r'^(?=.*[A-Z]).+$');
    if (!regexUpperCase.hasMatch(password)) {
      return 'Password must contain at least 1 capital letter';
    }

    RegExp regexDigit = RegExp(r'^(?=.*[0-9]).+$');
    if (!regexDigit.hasMatch(password)) {
      return 'Password must contain at least 1 digit';
    }

    return null;
  }
}
