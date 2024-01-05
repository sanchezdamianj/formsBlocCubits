import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  //if i want to avoid errorMessages of each input before the user press the submit button, i can emit a new state and controlle it.

  void onSubmit() {
    emit(state.copyWith(
      formStatus: FormStatus.validating,
      username: Username.dirty(state.username.value),
      email: Email.dirty(state.email.value),
      password: Password.dirty(state.password.value),
      isValid: Formz.validate([state.username, state.email, state.password]),
    ));
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password, state.email])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password, state.username]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.username, state.email]),
    ));
  }
}
