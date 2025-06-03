import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/features/login/presentation/cubit/login_cubit.dart';
import 'package:swastha_ai/features/login/presentation/cubit/login_state.dart';
import 'package:swastha_ai/features/login/presentation/widgets/login_form.dart';
import 'package:swastha_ai/features/login/presentation/widgets/signup_section.dart';
import 'package:swastha_ai/gen/assets.gen.dart';
import 'package:swastha_ai/routes/paths.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is LoginSuccess) {
          // TODO: Navigate to home page or handle successful login
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.secondary],
              stops: const [0.5, 1.0],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Assets.icons.appIconNoBg.image(width: 100, height: 100),
                    const SizedBox(height: 16),
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const LoginForm(),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => context.push(Paths.forgotPassword),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SignupSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
