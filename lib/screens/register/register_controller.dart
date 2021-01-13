import 'package:aplikasi_chat/data/models/custom_error.dart';
import 'package:aplikasi_chat/data/models/user.dart';
import 'package:aplikasi_chat/data/repositories/register_repository.dart';
import 'package:aplikasi_chat/utils/custom_shared_preferences.dart';
import 'package:aplikasi_chat/utils/state_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterController extends StateControl {
  final BuildContext context;

  RegisterRepository _registerRepository = RegisterRepository();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isFormValid = false;
  get isFormValid => _isFormValid;

  bool _formSubmitting = false;
  get formSubmitting => _formSubmitting;

  RegisterController({
    @required this.context,
  }) {
    this.init();
  }

  void init() {
    this.usernameController.addListener(this.validateForm);
    this.usernameController.addListener(this.validateForm);
    this.passwordController.addListener(this.validateForm);
  }

  void validateForm() {
    bool isFormValid = _isFormValid;
    String name = this.usernameController.value.text;
    String username = this.usernameController.value.text;
    String password = this.passwordController.value.text;
    if (name.trim() == "" || username.trim() == "" || password.trim() == "") {
      isFormValid = false;
    } else {
      isFormValid = true;
    }
    _isFormValid = isFormValid;
    notifyListeners();
  }

  void submitForm() async {
    _formSubmitting = true;
    notifyListeners();
    String name = this.usernameController.value.text;
    String username = this.usernameController.value.text;
    String password = this.passwordController.value.text;
    var loginResponse =
        await _registerRepository.register(name, username, password);
    if (loginResponse is CustomError) {
      showAlertDialog(loginResponse.message);
    } else if (loginResponse is User) {
      await CustomSharedPreferences.setString('user', loginResponse.toString());
      Navigator.of(context).pushNamedAndRemoveUntil('home', (_) => false);
    }
    _formSubmitting = false;
    notifyListeners();
  }

  showAlertDialog(String message) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Verifique os erros"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
