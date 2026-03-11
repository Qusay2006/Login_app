extension Validationnn on String {
  bool get isEmailValid {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(this);
  }
  bool get isPassValid {
    final passrex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return passrex.hasMatch(this);
  }

}