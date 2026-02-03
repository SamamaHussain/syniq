// lib/core/constants/route_names.dart
class RouteNames {
  // Auth Routes
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // Main App Routes
  static const String navbar = '/navbar';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String upload = '/upload';
  static const String settings = '/settings';

  static const String jobDesc = '/job-desc';

  static const String allServices = '/all-services';
  static const String analyzer = '/analyzer';
  static const String score = '/score';

  // Parameterized Routes
  static const String resumeDetail = 'resume/:id';

  // Helper to build detail route
  static String resumeDetailPath(String id) => '/home/resume/$id';
}
