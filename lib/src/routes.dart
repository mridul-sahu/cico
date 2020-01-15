import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';

export 'route_paths.dart';

import 'landing_component.template.dart' as landing_template;

class Routes {
  static final landing = RouteDefinition(
    routePath: RoutePaths.landing,
    component: landing_template.LandingComponentNgFactory,
  );
  static final all = <RouteDefinition>[
    landing,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.landing.toUrl(),
    )
  ];
}