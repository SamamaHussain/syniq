// lib/presentation/router/app_router.dart
import 'package:go_router/go_router.dart';
import 'package:syniq/Modules/Home/view/screens/bottom_nav_bar.dart';
import 'package:syniq/Modules/Home/view/screens/home_screen.dart';
import 'package:syniq/Modules/Job%20Description/job_decs_screen.dart';
import 'package:syniq/Modules/analyzer/all_services_screen.dart';
import 'package:syniq/Modules/analyzer/analyze_screen.dart';
import 'package:syniq/Modules/analyzer/score_screen.dart';
import 'package:syniq/Modules/analyzer/upload_screen.dart';
import 'package:syniq/Modules/auth/views/splash_screen.dart';
import 'package:syniq/Modules/auth/views/welcome_screen.dart';
import 'package:syniq/Modules/auth/views/login_screen.dart';
import 'package:syniq/Modules/auth/views/signup_screen.dart';
import 'package:syniq/Modules/settings/settings_screen.dart';
import 'package:syniq/Routes/route_names.dart';

class AppRouter {
  // Make router globally accessible
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouteNames.splash,
    routes: [
      // Splash Screen (Initial Route)
      GoRoute(
        path: RouteNames.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      // Welcome Screen
      GoRoute(
        path: RouteNames.welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomePage(),
      ),

      // Auth Group (No authentication required)
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.signup,
        name: 'signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: RouteNames.home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.navbar,
        name: 'navbar',
        builder: (context, state) => const FloatingNavigation(),
      ),
      GoRoute(
        path: RouteNames.settings,
        name: 'settings',
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: RouteNames.jobDesc,
        name: 'jobDesc',
        builder: (context, state) => const JobDescPage(),
      ),
      GoRoute(
        path: RouteNames.allServices,
        name: 'allServices',
        builder: (context, state) => const AllServicesPage(),
      ),
      GoRoute(
        path: RouteNames.analyzer,
        name: 'analyzer',
        builder: (context, state) => const AnalyzerPage(),
      ),
      GoRoute(
        path: RouteNames.score,
        name: 'score',
        builder: (context, state) => const ScorePage(),
      ),
      GoRoute(
        path: RouteNames.upload,
        name: 'upload',
        builder: (context, state) => const UploadScreen(),
      ),
    ],
  );
}
