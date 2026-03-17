import 'package:syniq/services/gemini_service.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  static final Map<Type, dynamic> _services = {};

  static void registerServices() {
    _services[GeminiService] = GeminiService();
  }

  static T get<T>() {
    return _services[T] as T;
  }

  static void dispose() {
    _services.clear();
  }
}