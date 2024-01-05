import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:flutter_forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 15),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    return Form(
        child: Column(children: [
      CustomTextFormField(
        label: 'Username',
        onChanged: registerCubit.usernameChanged,
        errorMessage: username.errorMessage,
      ),
      const SizedBox(height: 15),
      CustomTextFormField(
        label: 'email',
        errorMessage: email.errorMessage,
        onChanged: registerCubit.emailChanged,
      ),
      const SizedBox(height: 15),
      CustomTextFormField(
        label: 'Password',
        onChanged: registerCubit.passwordChanged,
        errorMessage: password.errorMessage,
        // onChanged: (value) {
        //   registerCubit.passwordChanged(value);
        // },
        obscureText: true,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Password is required';
        //   }
        //   if (value.trim().isEmpty) return 'Password is required';
        //   if (value.trim().length < 6) {
        //     return 'Password must be at least 6 characters';
        //   }
        //   return null;

        // }
      ),
      const SizedBox(height: 15),
      FilledButton.tonalIcon(
          onPressed: () {
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Create User')),
      const SizedBox(height: 15),
    ]));
  }
}
