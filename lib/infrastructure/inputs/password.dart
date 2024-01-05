import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return 'Password is required';
    if (displayError == PasswordError.length) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.trim().isEmpty) return PasswordError.empty;
    if (value.trim().length < 6) {
      return PasswordError.length;
    }

    return value.isEmpty ? PasswordError.empty : null;
  }
}
