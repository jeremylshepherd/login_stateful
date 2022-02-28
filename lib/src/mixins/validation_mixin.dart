class ValidationMixin {
  String? validateEmail(String? value) {
    print('validateEmail hit');
    if (value == null || !value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    print('validatePassword hit');
    if (value == null || value.length < 8) {
      return 'Minimum password length is 8 characters';
    }
    return null;
  }
}
