import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swastha_ai/common_widgets/button_widget.dart';
import 'package:swastha_ai/core/constants/colors.dart';
import 'package:swastha_ai/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:swastha_ai/features/signup/presentation/cubit/signup_state.dart';
import 'package:swastha_ai/features/signup/presentation/widgets/otp_field.dart';
import 'package:swastha_ai/features/signup/presentation/widgets/resend_section.dart';
import 'package:swastha_ai/features/signup/presentation/widgets/verify_header.dart';

class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOTPChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  void _handleKeyPress(KeyEvent event, int index) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.backspace) {
        if (_controllers[index].text.isEmpty && index > 0) {
          _focusNodes[index - 1].requestFocus();
        }
      }
    }
  }

  String get _otp => _controllers.map((e) => e.text).join();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VerifyHeader(),
              const SizedBox(height: 32),
              _buildOTPFields(),
              const SizedBox(height: 32),
              _buildVerifyButton(),
              const SizedBox(height: 16),
              ResendSection(
                onResend: () {
                  // TODO: Implement resend logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      title: const Text(
        'Verify your email',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildOTPFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) => OTPField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          onChanged: (value) => _onOTPChanged(value, index),
          onKeyEvent: (event) => _handleKeyPress(event, index),
        ),
      ),
    );
  }

  Widget _buildVerifyButton() {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return ButtonWidget(
          text: 'Verify',
          backgroundColor: AppColors.primary,
          textColor: AppColors.white,
          isLoading: state is SignupLoading,
          onPressed: () {
            if (_otp.length == 4) {
              // TODO: Implement verification logic
            }
          },
        );
      },
    );
  }
}
