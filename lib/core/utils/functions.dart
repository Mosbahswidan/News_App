String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address is required.';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }

  String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number.
      ''';
  }

  return null;
}

String? validateUsername(String? formUsername) {
  if (formUsername == null || formUsername.isEmpty) {
    return 'Username is required.';
  }

  String pattern = r'^[a-z0-9._]{6,29}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formUsername)) {
    return '''Please enter right username.
      ''';
  }

  return null;
}
