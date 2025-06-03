import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha_ai/features/signup/presentation/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(const SignupInitial());

  Future<void> signup({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
  }) async {
    try {
      emit(const SignupLoading());

      // TODO: Implement actual signup logic here
      // This is where you would typically:
      // 1. Validate the email, password, and full name
      // 2. Check if passwords match
      // 3. Call your authentication service
      // 4. Handle the response

      // For now, we'll simulate a successful signup
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Simulate network delay
      emit(const SignupSuccess());
    } catch (e) {
      emit(SignupFailure(e.toString()));
    }
  }
}
