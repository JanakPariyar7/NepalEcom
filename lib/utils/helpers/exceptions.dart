/// Abstract base class for custom exceptions.
abstract class JAppException implements Exception {
  final String code;
  final String message;

  const JAppException(this.code, this.message);

  @override
  String toString() => '$runtimeType: $message';
}

/// Custom Exception for Firebase-related errors.
class JFirebaseException extends JAppException {
  JFirebaseException(String code)
    : super(
        code,
        _firebaseErrorMessages[code] ?? 'An unknown Firebase error occurred.',
      );

  static const Map<String, String> _firebaseErrorMessages = {
    'permission-denied': 'You do not have permission to perform this action.',
    'unavailable':
        'The server is currently unavailable. Please try again later.',
    'user-not-found': 'No user found for that email.',
    'wrong-password': 'Incorrect password.',
    'email-already-in-use': 'An account already exists for that email.',
    'invalid-email': 'The email address is not valid.',
    'operation-not-allowed': 'Email/password accounts are not enabled.',
    'weak-password': 'The password is too weak.',
    'too-many-requests': 'Too many attempts. Please try again later.',
    'network-request-failed': 'Network error. Check your internet connection.',
    'expired-action-code': 'The link has expired.',
    'invalid-action-code': 'The action code is invalid.',
    'user-disabled': 'This user account has been disabled.',
  };

  /// Optional: Create from FirebaseAuthException
  factory JFirebaseException.fromFirebaseAuth(Exception e) {
    final code = (e as dynamic).code ?? 'unknown';
    return JFirebaseException(code);
  }
}

/// Exception for invalid format/data structure.
class JFormatException extends JAppException {
  const JFormatException()
    : super('format-exception', 'Invalid data format or unexpected structure.');
}

/// Exception for platform-specific issues.
class JPlatformException extends JAppException {
  JPlatformException(String code)
    : super(
        code,
        _platformErrorMessages[code] ?? 'An unknown platform error occurred.',
      );

  static const Map<String, String> _platformErrorMessages = {
    'network_error': 'Network error. Please check your internet connection.',
    'device_not_supported': 'This feature is not supported on your device.',
    'timeout': 'The operation timed out. Please try again.',
    'storage-unavailable': 'Storage is temporarily unavailable.',
  };
}
