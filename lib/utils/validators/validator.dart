class TValidator {
  static String? validateIsEmptyText(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(email)) {
      return 'Email is not valid';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain one uppercase letter';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain one number';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain one uppercase letter';
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain one special character';
    }

    return null;
  }

  static String? validateFirstName(String? firstName) {
    if (firstName == null || firstName.isEmpty) {
      return 'First name is required';
    }

    if (firstName.length < 3) {
      return 'First name must be at least 3 characters';
    }
    return null;
  }

  static String? validateLastName(String? lastName) {
    if (lastName == null || lastName.isEmpty) {
      return 'Last name is required';
    }

    if (lastName.length < 3) {
      return 'Last name must be at least 3 characters';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegExp = RegExp(
        r'^[+]?\d{1,4}?[-.\\s]?[(]?\d{1,3}[)]?[-.\\s]?\d{1,4}[-.\\s]?\d{1,9}$');

    if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Phone number is not valid';
    }

    return null;
  }

  static String? valiedateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required';
    }

    if (username.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }
}
