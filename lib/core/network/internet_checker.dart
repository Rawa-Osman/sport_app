import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker {
  late InternetConnection instance;
  void init() {
    instance = InternetConnection();
  }

  Future<bool> isConnected() async => await instance.hasInternetAccess;
}
