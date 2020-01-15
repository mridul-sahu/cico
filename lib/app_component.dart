import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:cico_site/src/routes.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  template: '''
    <router-outlet [routes]="Routes.all"></router-outlet>
    ''',
  directives: [
    routerDirectives,
  ],
  exports: [Routes],
)
class AppComponent {}
