import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('State Managment simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/cubits');
            },
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('State Managment'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/counter-bloc');
            },
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10), child: Divider()),
          ListTile(
              title: const Text('Register'),
              subtitle: const Text('Sign up'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                context.push('/sign-up');
              })
        ],
      ),
    );
  }
}
