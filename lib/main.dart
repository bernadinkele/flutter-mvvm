import 'package:flutter/material.dart';
import 'package:mvvm/utils/Routes/route_name.dart';
import 'package:mvvm/utils/Routes/routes.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      initialRoute: RouteName.home,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}