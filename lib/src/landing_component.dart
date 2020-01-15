import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';
import 'dart:html';

@Component(
  selector: "cico-landing",
  templateUrl: "landing_component.html",
  directives: [
    coreDirectives,
    routerDirectives,
  ],
  exports: [
    RoutePaths,
  ],
)
class LandingComponent implements AfterViewChecked {
  Router _router;
  bool _processed = false;

  LandingComponent(this._router);

  void smoothScrolling({int offset = 0, int duration = 500}) {
    String selector1 = ".navbar-nav a";
    String selector2 = ".to-top a";
    void trigger(MouseEvent click) {
      click.preventDefault();
      String link = click.target.toString();
      var idx = link.indexOf('#');
      if (idx <= 0) return;
      String anchor = link.substring(idx);
      int targetPosition = querySelector('$anchor').offsetTop;
      targetPosition += offset;
      int totalFrames = (duration / (1000 / 60)).round();
      int currentFrame = 0;
      int currentPosition = window.scrollY;
      int distanceBetween = targetPosition - currentPosition;
      num distancePerFrame = distanceBetween / totalFrames;

      void animation(num frame) {
        if (totalFrames >= currentFrame) {
          window.scrollTo(0, currentPosition);
          currentPosition += distancePerFrame.toInt();
          currentFrame++;
          window.animationFrame.then(animation);
        }
      }

      window.animationFrame.then(animation);
    }

    var selected1 = querySelectorAll(selector1);
    var selected2 = querySelectorAll(selector2);
    if (selected1.isNotEmpty && selected2.isNotEmpty) this._processed = true;
    selected1.onClick.listen(trigger);
    selected2.onClick.listen(trigger);
  }

  @override
  void ngAfterViewChecked() {
    if (this._processed) return;
    smoothScrolling(offset: -60);
  }
}
