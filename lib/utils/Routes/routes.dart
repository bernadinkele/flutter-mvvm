import 'package:flutter/material.dart';
import 'package:mvvm/utils/Routes/route_name.dart';
import 'package:mvvm/views/Auth/sign_in_view.dart';
import 'package:mvvm/views/Auth/sign_up_view.dart';
import 'package:mvvm/views/Home/home_view.dart';
import 'package:mvvm/views/no_route_found.dart';
class Routes{
 
   static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
   // final arguments= routeSettings.arguments;
    switch (routeSettings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeView(),);
       case RouteName.signIn:
        return MaterialPageRoute(builder: (context) => const SignInView(),);
       case RouteName.singUp:
        return MaterialPageRoute(builder: (context) => const SignUpView(),);
      
      default:
      return MaterialPageRoute(builder: (context) => const NoRouteFound(),);
    }
  }

}