///
/// **************************************************************
/// **** [GENERATED CODE - ONLY MODIFY IMPORT PATH IF NEEDED] ****
/// **************************************************************
///
// ignore_for_file: constant_identifier_names, non_constant_identifier_names, dangling_library_doc_comments
import 'package:uloc/uloc.dart';
import 'package:template/app/screens/home/controllers/home_controller.dart';
import 'package:template/app/screens/home/views/pages/home_page.dart';
import 'package:template/app/screens/user/controllers/user_controller.dart';
import 'package:template/app/screens/user/views/pages/user_page.dart';
import 'package:template/app/screens/detail/controllers/detail_controller.dart';
import 'package:template/app/screens/detail/views/pages/detail_page.dart';


/// use this for [named navigation]
class Routes {
  Routes._();

  static ULoCRoute HOME = ULoCRoute('/home');
  static ULoCRoute USER = ULoCRoute('/user');
  static ULoCRoute DETAIL({String? id}) => ULoCRoute( '/detail/:id', routeParams: [id] );

  static ULoCRoute fromString(String? url) => ULoCRoute.fromString(url);

   /// use this to pass to [MaterialApp] Route setting
  static final ULoCRouteConfiguration ulocRouteConfiguration = ULoCRouteConfiguration([
    RouteProperties<HomeController>(
      routeName: Routes.HOME,
      provider: (context, _) => HomeController(context),
      child: HomePage(),
    ),
    RouteProperties<UserController>(
      routeName: Routes.USER,
      provider: (context, _) => UserController(context),
      child: UserPage(),
    ),
    RouteProperties<DetailController>(
      routeName: Routes.DETAIL(),
      provider: (context, route) => DetailController( context, id: route?.param('id') ),
      child: DetailPage(),
    ),
  ]);
}
