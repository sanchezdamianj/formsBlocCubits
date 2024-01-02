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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String username = '';
  // String email = ' ';
  // String password = '';
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
        key: _formKey,
        child: Column(children: [
          CustomTextFormField(
              label: 'Username',
              onChanged: (value) {
                registerCubit.usernameChanged(value);
                _formKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }
                if (value.trim().isEmpty) return 'Username is required';
                if (value.trim().length < 6) {
                  return 'Username must be at least 6 characters';
                }
                return null;
              }),
          const SizedBox(height: 15),
          CustomTextFormField(
              label: 'email',
              onChanged: (value) {
                registerCubit.emailChanged(value);
                _formKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                if (value.trim().isEmpty) return 'Email is required';

                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );

                if (!emailRegExp.hasMatch(value.trim())) {
                  return 'Email has not the correct formatassd';
                }
                return null;
              }),
          const SizedBox(height: 15),
          CustomTextFormField(
              label: 'Password',
              onChanged: (value) {
                registerCubit.passwordChanged(value);
                _formKey.currentState?.validate();
              },
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.trim().isEmpty) return 'Password is required';
                if (value.trim().length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              }),
          const SizedBox(height: 15),
          FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;

                registerCubit.onSubmit();
              },
              icon: const Icon(Icons.save),
              label: const Text('Create User')),
          const SizedBox(height: 15),
        ]));
  }
}
