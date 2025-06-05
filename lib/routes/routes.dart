import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swastha_ai/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:swastha_ai/features/login/presentation/cubit/login_cubit.dart';
import 'package:swastha_ai/features/login/presentation/pages/login_page.dart';
import 'package:swastha_ai/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:swastha_ai/features/signup/presentation/pages/signup_page.dart';
import 'package:swastha_ai/features/signup/presentation/pages/verify_otp_page.dart';
import 'package:swastha_ai/features/welcome/presentation/pages/welcome_page.dart';
import 'package:swastha_ai/routes/paths.dart';

final router = GoRouter(
  initialLocation: Paths.welcome,
  routes: [
    GoRoute(
      path: Paths.login,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginPage(),
        );
      },
    ),
    GoRoute(
      path: Paths.signup,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => SignupCubit(),
          child: const SignupPage(),
        );
      },
    ),
    GoRoute(
      path: Paths.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: Paths.verifyOTP,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => SignupCubit(),
          child: const VerifyOTPPage(),
        );
      },
    ),
    GoRoute(
      path: Paths.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);
