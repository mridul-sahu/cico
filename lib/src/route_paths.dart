import 'package:angular_router/angular_router.dart';

class RouteData {
  final String label;

  RouteData(this.label);
}

class RoutePaths {
  static final landing = RoutePath(
    path: "",
    additionalData: RouteData("Landing"),
  );
}