import 'package:Pokedex/view/screens/authentication/auth_home_screen.dart';
import 'package:Pokedex/view/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> toDashboard() {
    return _pushRoute(AppRoutes.dashboard, clearStack: true);
  }

  Future<void> toAuthentication() {
    return _pushRoute(AppRoutes.authentication, clearStack: true);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (context) => Dashboard());

      case AppRoutes.authentication:
        return MaterialPageRoute(builder: (context) => AuthHomeScreen());
    }
    return null;
  }

  Future<T> _pushRoute<T>(String routeName,
      {Object arguments, bool clearStack = false}) {
    if (clearStack) {
      return navigatorKey.currentState.pushNamedAndRemoveUntil<T>(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return navigatorKey.currentState
          .pushNamed<T>(routeName, arguments: arguments);
    }
  }
}
