enum LoginType {
  EMAIL,
  PHONE,
  GOOGLE,
  APPLE,
}

extension ParseLoginType on LoginType {
  String toViewString() {
    if (this == LoginType.APPLE || this == LoginType.GOOGLE) {
      return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
    } else {
      return name.toLowerCase();
    }
  }

  String toSignUpString() {
    switch (this) {
      case LoginType.EMAIL:
        return 'Sign up with email ';
      case LoginType.PHONE:
        return 'Sign up with phone ';
      case LoginType.GOOGLE:
        return 'Sign in with Google';
      case LoginType.APPLE:
        return 'Sign in with Apple ';
    }
  }

  String toSignInString() {
    switch (this) {
      case LoginType.EMAIL:
        return 'Sign in with email ';
      case LoginType.PHONE:
        return 'Sign in with phone ';
      case LoginType.GOOGLE:
        return 'Sign in with Google';
      case LoginType.APPLE:
        return 'Sign in with Apple ';
    }
  }
}
