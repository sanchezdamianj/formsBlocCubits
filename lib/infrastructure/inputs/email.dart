import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, length, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'Username is required';
    if (displayError == EmailError.length) {
      return 'Username must be at least 6 characters';
    }

    if (displayError == EmailError.format) {
      return 'Invalid email format';
    }

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EmailError.empty;
    }

    if (value.length < 6) {
      return EmailError.length;
    }

    if (!emailRegExp.hasMatch(value.trim())) {
      return EmailError.format;
    }
    return null;
  }
}
