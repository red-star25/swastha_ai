import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swastha_ai/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  Future<void> login({required String email, required String password}) async {
    try {
      emit(const LoginLoading());

      // TODO: Implement actual login logic here
      // This is where you would typically:
      // 1. Validate the email and password
      // 2. Call your authentication service
      // 3. Handle the response

      // For now, we'll simulate a successful login
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Simulate network delay
      emit(const LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
