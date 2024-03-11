import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/authentication/cubit/authentication_cubit.dart';
import 'package:weather/presentation/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff47BBE1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.cerah.path,
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationSuccess) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                } else if (state is AuthenticationError) {
                  print(state.error);
                }
              },
              child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationCubit>().signInWithGoogle();
                  },
                  child: const Text("Sign in with Google")),
            ),
          ],
        ),
      ),
    );
  }
}
