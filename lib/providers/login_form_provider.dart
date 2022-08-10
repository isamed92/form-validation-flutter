import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  // bool isLoading;
  bool isValidForm() {
    print('$email, $password');
    return formKey.currentState?.validate() ?? false;
  }
}
