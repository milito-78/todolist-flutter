import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/domain/entities/user.dart';
import 'package:todolist/infrastructure/api/base_data.dart';
import 'package:todolist/repository/user/i_user_repository.dart';
import 'package:todolist/repository/user/user_repository.dart';

class RegisterController extends GetxController{
  final IUserRepository _repository         = UserRepository();
  final loginFormKey                        = GlobalKey<FormState>();
  final passwordInputController             = TextEditingController();
  final passwordConfirmationInputController = TextEditingController();
  final emailInputController                = TextEditingController();
  final nameInputController                 = TextEditingController();

  BaseData<User> user = BaseData.loading();

  @override
  void onClose() {
    passwordInputController.dispose();
    emailInputController.dispose();
    super.onClose();
  }

  void _setUser(BaseData<User> response) {
    user = response;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please full name field must be filled';
    }

    if(value.length < 5){
      return 'Full name length must greater than 4';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please password field must be filled';
    }
    //todo regex
    if(value.length < 8){
      return 'password length must greater than 7';
    }

    if (value != passwordConfirmationInputController.toString()) {
      return 'password is not equal to confirmation password';
    }

    return null;
  }

  String? passwordConfirmationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please password confirmation field must be filled';
    }

    if (value != passwordInputController.toString()) {
      return 'password is not equal to confirmation password';
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please email field must be filled';
    }
    //todo email
    return null;
  }

  Future<void> registerUser() async {
    print(formParams());
    return;
    _setUser(BaseData.loading());
    _repository
        .save(formParams())
        .then((value) => _setUser(BaseData.completed(value)))
        .onError((error, stackTrace) => _setUser(BaseData.error(error.toString())));
  }

  Map<String, dynamic> formParams(){
    return {
      "email" : emailInputController.value,
      "password" : passwordInputController.value,
      "password_confirmation" : passwordConfirmationInputController.value,
      "full_name" : nameInputController.value
    };
  }

}