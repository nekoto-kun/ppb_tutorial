class ValidatorHelper {
  static String? email(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    return null;
  }
}