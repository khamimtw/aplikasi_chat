import 'package:aplikasi_chat/utils/state_control.dart';
import 'package:flutter/material.dart';

class ResetPasswordController extends StateControl {


  final BuildContext context;

  TextEditingController emailController = TextEditingController();


  bool _isFormValid = false;
  get isFormValid => _isFormValid;

  bool _formSubmitting = false;
  get formSubmitting => _formSubmitting;

  ResetPasswordController({@required this.context}) {
    this.init();
  }

  void init() {
    this.emailController.addListener(this.validateForm);
  }

  @override
  void dispose() {
    super.dispose();
    this.emailController.dispose();
  }

  void submitForm() async {
    _formSubmitting = true;
  
  }

  void validateForm() {
    bool isFormValid = _isFormValid;
    String username = this.emailController.value.text;
    if (username.trim() == "") {
      isFormValid = false;
    } else {
      isFormValid = true;
    }
    _isFormValid = isFormValid;
    notifyListeners();
  }


  
}
