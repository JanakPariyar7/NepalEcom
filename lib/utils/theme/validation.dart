class JValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null; // Valid email
  }

  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    return null; // Valid password
  }

  static String? validateUsername(String? value, {int minLength = 3}) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }

    if (value.length < minLength) {
      return 'Username must be at least $minLength characters';
    }

    return null; // Valid username
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Enter a valid phone number';
    }

    return null; // Valid phone number
  }

  static String? validateNonEmptyField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null; // Valid field
  }
}
