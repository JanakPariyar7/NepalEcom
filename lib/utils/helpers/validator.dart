class JValidator {
  /// ✅ Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    final emailRegEx = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegEx.hasMatch(value)) {
      return 'Invalid email format.';
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  /// ✅ Password Validation (must contain at least one symbol and one number)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters.';
    }

    final passwordRegex = RegExp(r'^(?=.*[0-9])(?=.*[!@#\$&*~]).{6,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must include at least one number and one symbol.';
    }

    return null;
  }

  /// ✅ Phone Number Validation (only numbers, exactly 10 digits)
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    final phoneRegex = RegExp(r'^[0-9]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Phone number must contain only digits.';
    }

    if (value.length != 10) {
      return 'Phone number must be exactly 10 digits.';
    }

    return null;
  }
}
