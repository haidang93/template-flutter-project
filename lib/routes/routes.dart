import 'package:uloc/uloc.dart';
import 'package:template/app/screens/home/controllers/home_controller.dart';
import 'package:template/app/screens/home/views/pages/home_page.dart';
import 'package:template/app/screens/user/controllers/user_controller.dart';
import 'package:template/app/screens/user/views/pages/user_page.dart';
import 'package:template/app/screens/detail/controllers/detail_controller.dart';
import 'package:template/app/screens/detail/views/pages/detail_page.dart';

@ULoCDeclaration()
class MyRoutes extends ULoCRouteDeclaration {
  @override
  Map<String, ULoCRouteDefine<ULoCProvider>> get route => {
    'HOME': ULoCRouteDefine(
      route: '/home',
      provider: (context, _) => HomeController(context),
      child: HomePage,
    ),
    'USER': ULoCRouteDefine(
      route: '/user',
      provider: (context, _) => UserController(context),
      child: UserPage,
    ),
    'DETAIL': ULoCRouteDefine(
      route: '/detail/:id',
      provider: (context, route) => DetailController( context, id: route?.param('id') ),
      child: DetailPage,
    ),
  };
}
