import 'package:go_router/go_router.dart';
import 'package:swastha_ai/features/login/presentation/pages/login_page.dart';
import 'package:swastha_ai/features/welcome/presentation/pages/welcome_page.dart';
import 'package:swastha_ai/routes/paths.dart';

final router = GoRouter(
  initialLocation: Paths.welcome,
  routes: [
    GoRoute(path: Paths.login, builder: (context, state) => const LoginPage()),
    GoRoute(
      path: Paths.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
  ],
);
