import 'package:flutter/material.dart';

double convertToBool(bool e) {
  if (e == true) {
    return 1;
  } else {
    return 0;
  }
}

double checkStrongPassword(String password, [int minLength = 8]) {
  if (password.isEmpty) return 0;
  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length >= minLength;
  double val = convertToBool(hasUppercase) +
      convertToBool(hasDigits) +
      convertToBool(hasLowercase) +
      convertToBool(hasSpecialCharacters) +
      convertToBool(hasMinLength);
  return val / 5.0;
}

Color getStrengthColor(double val) {
  int tmpVal = (val * 5).toInt();
  switch (tmpVal) {
    case 0:
      return Colors.black;
    case 1:
    case 2:
      return Colors.red;
    case 3:
      return Colors.yellow;
    case 4:
      return Colors.amber;
    default:
      return Colors.green;
  }
}

class PasswordIndicator extends StatelessWidget {
  final String pwd;
  const PasswordIndicator({Key? key, required this.pwd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 20,
        child: LinearProgressIndicator(
          value: checkStrongPassword(pwd),
          color: getStrengthColor(checkStrongPassword(pwd)),
        ),
      ),
    );
  }
}
