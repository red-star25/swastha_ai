import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swastha_ai/common_widgets/button_widget.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/core/widgets/common_text_field.dart';
import 'package:swastha_ai/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:swastha_ai/features/signup/presentation/cubit/signup_state.dart';
import 'package:swastha_ai/routes/paths.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CommonTextField(
            controller: _fullNameController,
            labelText: 'Full Name',
            prefixIcon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CommonTextField(
            controller: _emailController,
            labelText: 'Email',
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CommonTextField(
            controller: _passwordController,
            labelText: 'Password',
            prefixIcon: Icons.lock,
            isPassword: true,
            isPasswordVisible: _isPasswordVisible,
            onTogglePassword: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CommonTextField(
            controller: _confirmPasswordController,
            labelText: 'Confirm Password',
            prefixIcon: Icons.lock,
            isPassword: true,
            isPasswordVisible: _isConfirmPasswordVisible,
            onTogglePassword: () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return ButtonWidget(
                text: 'Sign Up',
                backgroundColor: AppColors.white,
                textColor: AppColors.primary,
                isLoading: state is SignupLoading,
                onPressed: () {
                  context.push(Paths.verifyOTP);
                  // if (_formKey.currentState!.validate()) {
                  //   context.read<SignupCubit>().signup(
                  //     email: _emailController.text,
                  //     password: _passwordController.text,
                  //     confirmPassword: _confirmPasswordController.text,
                  //     fullName: _fullNameController.text,
                  //   );
                  // }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
